CC := g++
INCLUDE_DIRS := .
SOURCE_DIRS  += $(INCLUDE_DIRS)
PROJECT_DIR  := $(shell  cd ../.. && pwd)
OUT_DIR := $(PROJECT_DIR)/out/main
TARGET := aphan
TARGET_DIR := $(PROJECT_DIR)/out/bin

SRCS := $(foreach dir, $(SOURCE_DIRS), $(wildcard $(dir)/*.cpp))
SRCS_FILES := $(notdir $(SRCS))
OBJS := $(patsubst %.cpp, %.o, $(SRCS_FILES))
INCLUDES := $(addprefix -I, $(INCLUDE_DIRS))

define make-goal
$(OUT_DIR)/%.o:$(1)/%.cpp
	$(CC)  $(INCLUDES) -c $$< -o $$@
endef

.PHONY: all checkdir clean
all: checkdir $(TARGET)

checkdir:$(OUT_DIR) $(TARGET_DIR)
$(OUT_DIR):
	@mkdir -p $@
$(TARGET_DIR):
	@mkdir -p $@
clean:
	cd $(PROJECT_DIR) && rm -rf out
	
OBJS_ALL := $(addprefix $(OUT_DIR)/, $(OBJS))

$(TARGET):$(OBJS_ALL)
	$(CC) $^ -o $(TARGET_DIR)/$@

$(foreach out, $(SOURCE_DIRS),$(eval $(call make-goal,$(out))))
