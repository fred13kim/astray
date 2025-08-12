add_library(astray_kernel)
target_sources(astray_kernel PRIVATE sched.c task.c astrayos.c)

add_library(astray_kernel_include INTERFACE)
target_include_directories(astray_kernel_include INTERFACE inc)
