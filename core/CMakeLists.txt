add_library(astray_core)

target_include_directories(astray_core INTERFACE .)
target_sources(astray_core PRIVATE sys.s startup.s)
