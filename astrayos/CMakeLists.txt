add_executable(astrayos.elf src/main.c)

target_link_libraries(astrayos.elf PRIVATE astray_kernel)

add_custom_target(
  flash
  COMMAND openocd -f board/st_nucleo_f4.cfg -c
          "program ${CMAKE_CURRENT_BINARY_DIR}/astrayos.elf verify reset exit"
  DEPENDS astrayos.elf
  COMMENT "Flashing firmware")

add_custom_target(
  debug
  COMMAND openocd -f board/st_nucleo_f4.cfg
  COMMENT "Running openocd server")
