add_library(astray_kernel)

target_sources(astray_kernel PRIVATE startup.s task.c)

target_link_libraries(astray_kernel PUBLIC astray_kernel_include)
