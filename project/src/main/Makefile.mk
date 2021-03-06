ifndef $(PROJECT_DIR)
PROJECT_DIR  := $(shell  cd ../.. && pwd)
endif

ifndef $(OUT_DIR)
OUT_DIR := out
endif 

LOC_DIRS := . 

INCLUDE_DIRS := $(LOC_DIRS) \
../module1/base \
../module1/module \
../module2/base \
../module2/module

SOURCE_DIRS  := $(LOC_DIRS)

OBJ_DIR := $(PROJECT_DIR)/$(OUT_DIR)/main

TARGET := aphan
TARGET_DIR := $(PROJECT_DIR)/$(OUT_DIR)/bin

LIBS_DIRS := $(TARGET_DIR)
LIBS := Module1 \
Module2

CLIBFLAG += $(addprefix -L, $(LIBS_DIRS))
CLIBFLAG += $(addprefix -l, $(LIBS))

SRCS := $(foreach dir, $(SOURCE_DIRS), $(wildcard $(dir)/*.cpp))
SRCS_FILES := $(notdir $(SRCS))
OBJS := $(patsubst %.cpp, %.o, $(SRCS_FILES))
INCLUDES := $(addprefix -I, $(INCLUDE_DIRS))

define make-goal
$(OBJ_DIR)/%.o:$(1)/%.cpp
	$(CC)  $(INCLUDES) -c $$< -o $$@
	@echo $$<
	@echo $$@
endef

.PHONY: all checkdir clean

all: checkdir $(TARGET)

checkdir:$(OBJ_DIR) $(TARGET_DIR)

$(OBJ_DIR):
	@mkdir -p $@
$(TARGET_DIR):
	@mkdir -p $@
clean:
	cd $(PROJECT_DIR) && rm -rf $(OUT_DIR)
	
OBJS_ALL := $(addprefix $(OBJ_DIR)/, $(OBJS))

$(TARGET):$(OBJS_ALL)
	$(CC) $^ -o $(TARGET_DIR)/$@ $(CLIBFLAG)

$(foreach out, $(SOURCE_DIRS),$(eval $(call make-goal,$(out))))
