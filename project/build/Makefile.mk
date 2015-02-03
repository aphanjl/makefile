export CC := g++
export PROJECT_DIR := $(shell cd .. && pwd)
export SOURCE_DIR := $(PROJECT_DIR)/src
export OUT_DIR := out

MAIN_MODULE := main
SUB_MODULES :=  module1 module2
ALL_MODULES := $(MAIN_MODULE) $(SUB_MODULES) 

.PHONY: all $(ALL_MODULES) clean
all: $(ALL_MODULES)

$(ALL_MODULES):
	$(MAKE) -C  $(SOURCE_DIR)/$@ -f Makefile.mk

$(MAIN_MODULE): $(SUB_MODULES)

clean: 
	cd $(PROJECT_DIR) && rm -rf $(OUT_DIR)
