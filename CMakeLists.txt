cmake_minimum_required(VERSION 3.20)
set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 11)

project(astray C CXX ASM)

file(GLOB LINKER_SCRIPT "ld/*.ld")

# Setup Toolchain
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR cortex-m4)

set(CMAKE_C_COMPILER arm-none-eabi-gcc)
set(CMAKE_CXX_COMPILER arm-none-eabi-g++)
set(CMAKE_ASM_COMPILER arm-none-eabi-gcc)
set(CMAKE_OBJCOPY arm-none-eabi-objcopy)
set(CMAKE_OBJDUMP arm-none-eabi-objdump)

add_compile_options(
  -mcpu=${CMAKE_SYSTEM_PROCESSOR}
  -mthumb
  -mfloat-abi=soft
  -specs=nosys.specs
  # Warnings
  -Wall
  -Wextra
  -Wshadow
  -Wundef
  -Wdouble-promotion
  -Wformat=2
  -Wformat-truncation
  -Wconversion
  # Code Gen
  -fno-common
  # Optimization
  -ffunction-sections
  -fdata-sections
  # Debug
  -O0
  -g3
  # Optional
  -fstack-usage)

add_link_options(-T ${LINKER_SCRIPT} -Wl,-Map=astray.map -nostartfiles)

add_subdirectory(src)
add_subdirectory(inc)
add_subdirectory(astrayos)
