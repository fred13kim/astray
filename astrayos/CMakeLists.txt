add_executable(astrayos.elf src/main.c)

target_link_libraries(astrayos.elf PRIVATE astray_kernel)
