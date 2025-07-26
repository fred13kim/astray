# Makefile to automate mkdir, cmake, and build steps

# Variables
BUILD_DIR := build
CMAKE_FLAGS :=
TARGET := all

.PHONY: all build clean rebuild

all: build

build:
	@echo "==> Creating build directory..."
	@mkdir -p $(BUILD_DIR)
	@cd $(BUILD_DIR) && cmake $(CMAKE_FLAGS) ..
	@cd $(BUILD_DIR) && make $(TARGET)

clean:
	@echo "==> Cleaning build directory..."
	@rm -rf $(BUILD_DIR)

rebuild: clean build

debug:
	@echo "==> Running 'make debug' in $(BUILD_DIR)..."
	@$(MAKE) -C $(BUILD_DIR) debug

flash:
	@echo "==> Running 'make flash' in $(BUILD_DIR)..."
	@$(MAKE) -C $(BUILD_DIR) flash
