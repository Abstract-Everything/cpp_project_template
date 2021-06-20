find_package(sdl2 REQUIRED)

add_executable(test_sdl main.cpp)
target_link_libraries(test_sdl PRIVATE sdl2::sdl2)
