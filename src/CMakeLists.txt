option(CPP_STARTER_USE_QT "Enable compilation of QT sample" OFF)
option(CPP_STARTER_USE_FLTK "Enable compilation of FLTK sample" OFF)
option(CPP_STARTER_USE_GTKMM "Enable compilation of GTKMM sample" OFF)
option(CPP_STARTER_USE_IMGUI "Enable compilation of ImGui sample" OFF)

# qt
if(CPP_STARTER_USE_QT)
        message("Using Qt")
        add_subdirectory(qt)
endif()

# fltk test
if(CPP_STARTER_USE_FLTK)
        message("Using FLTK")
        add_subdirectory(fltk)
endif()

# gtkmm test
if(CPP_STARTER_USE_GTKMM)
        message("Using gtkmm")
        add_subdirectory(gtkmm)
endif()

# imgui example
if(CPP_STARTER_USE_IMGUI)
        message("Using Dear ImGui")
        add_subdirectory(imgui)
endif()

find_package(fmt REQUIRED)
find_package(docopt REQUIRED)
find_package(spdlog REQUIRED)

# Generic test that uses conan libs
add_executable(intro main.cpp)
target_link_libraries(
        intro
        PRIVATE project_options
                project_warnings
                docopt::docopt
                fmt::fmt
                spdlog::spdlog)
