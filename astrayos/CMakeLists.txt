add_subdirectory(core)
add_subdirectory(kernel)

target_link_libraries(astray_kernel PUBLIC 
    astray_kernel_include
    astray_core 
)

target_link_libraries(astray_kernel PRIVATE astray_core_include)
