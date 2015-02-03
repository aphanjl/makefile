ifndef $(PROJECT_DIR)
PROJECT_DIR  := $(shell  cd ../.. && pwd)
endif

ifndef $(OUT_DIR)
OUT_DIR := out
endif 

INCLUDE_DIRS := . \
base \
module

SOURCE_DIRS  += $(INCLUDE_DIRS)
OBJ_DIR := $(PROJECT_DIR)/$(OUT_DIR)/module1

TARGET := libModule1.a
TARGET_DIR := $(PROJECT_DIR)/$(OUT_DIR)/bin

SRCS := $(foreach dir, $(SOURCE_DIRS), $(wildcard $(dir)/*.cpp))
SRCS_FILES := $(notdir $(SRCS))
OBJS := $(patsubst %.cpp, %.o, $(SRCS_FILES))
INCLUDES := $(addprefix -I, $(INCLUDE_DIRS))

define make-goal
$(OBJ_DIR)/%.o:$(1)/%.cpp
	$(CC)  $(INCLUDES) -c $$< -o $$@
endef

.PHONY: all checkdir clean

all: checkdir $(TARGET)

checkdir:$(OBJ_DIR) $(TARGET_DIR)

$(OBJ_DIR):
	@mkdir -p $@
$(TARGET_DIR):
	@mkdir -p $@
clean:
	cd $(PROJECT_DIR) && \
	rm -f $(OUT_DIR)/bin/$(TARGET) && \
	rm -rf $(OUT_DIR)/module1
	
OBJS_ALL := $(addprefix $(OBJ_DIR)/, $(OBJS))

$(TARGET):$(OBJS_ALL)
	$(AR) cqs $(TARGET_DIR)/$@ $^

$(foreach out, $(SOURCE_DIRS),$(eval $(call make-goal,$(out))))
