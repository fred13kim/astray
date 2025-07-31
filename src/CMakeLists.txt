add_library(astray_kernel)

target_sources(astray_kernel PRIVATE task.c list.c astrayos.c)

target_link_libraries(astray_kernel PUBLIC astray_kernel_include astray_core)
