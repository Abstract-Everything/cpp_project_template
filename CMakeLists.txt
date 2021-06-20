cmake_minimum_required(VERSION 3.15)

# Set the project name to your project name, my project isn't very descriptive
project(myproject CXX)

include(cmake/Constants.cmake)
include(cmake/PreventInSourceBuilds.cmake)
include(cmake/StandardProjectSettings.cmake)
include(cmake/LinkTimeOptimization.cmake)
include(cmake/TimeTrace.cmake)
include(cmake/CompilerWarnings.cmake)
include(cmake/Cache.cmake)
include(cmake/Sanitizers.cmake)
include(cmake/StaticAnalyzers.cmake)
include(cmake/Doxygen.cmake)
include(cmake/PrecompileHeaders.cmake)
include(cmake/Tests.cmake)

# Link this 'library' to set the c++ standard / compile-time options requested
add_library(project_options INTERFACE)
target_compile_features(project_options INTERFACE cxx_std_17)
enable_time_trace(project_options)

# Link this 'library' to use the warnings specified in CompilerWarnings.cmake
add_library(project_warnings INTERFACE)
set_project_warnings(project_warnings)

enable_ipo()
enable_pch()
option(BUILD_SHARED_LIBS "Enable compilation of shared libraries" OFF)

enable_doxygen()
enable_ccache()
enable_sanitizers(project_options)
enable_static_analyzers()

enable_tests()

add_subdirectory(dependencies)
add_subdirectory(test)
add_subdirectory(fuzz_test)
add_subdirectory(src)

option(ENABLE_UNITY "Enable Unity builds of projects" OFF)
if(ENABLE_UNITY)
        # Add for any project you want to apply unity builds for
        set_target_properties(intro PROPERTIES UNITY_BUILD ON)
endif()
