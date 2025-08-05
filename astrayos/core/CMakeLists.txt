add_library(astray_core)

target_sources(astray_core PUBLIC isr_handler.s startup.s sys.s)
target_include_directories(astray_core INTERFACE inc)
