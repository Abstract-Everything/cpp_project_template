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

# Link this 'library' to set the c++ standard / compile-time options requested
add_library(project_options INTERFACE)
target_compile_features(project_options INTERFACE cxx_std_17)
enable_time_trace(project_options)

# Link this 'library' to use the warnings specified in CompilerWarnings.cmake
add_library(project_warnings INTERFACE)
set_project_warnings(project_warnings)

enable_ipo()

enable_doxygen()
enable_ccache()
enable_sanitizers(project_options)
enable_static_analyzers()

option(BUILD_SHARED_LIBS "Enable compilation of shared libraries" OFF)
option(ENABLE_TESTING "Enable Test Builds" ON)
option(ENABLE_FUZZING "Enable Fuzzing Builds" OFF)

# Very basic PCH example
option(ENABLE_PCH "Enable Precompiled Headers" OFF)
if(ENABLE_PCH)
        # This sets a global PCH parameter, each project will build its own PCH,
        # which is a good idea if any #define's change
        #
        # consider breaking this out per project as necessary
        target_precompile_headers(
                project_options
                INTERFACE
                <vector>
                <string>
                <map>
                <utility>)
endif()

add_subdirectory(dependencies)

if(ENABLE_TESTING)
        enable_testing()
        message(
                "Building Tests. Be sure to check out test/constexpr_tests for constexpr testing"
        )
        add_subdirectory(test)
endif()

if(ENABLE_FUZZING)
        message(
                "Building Fuzz Tests, using fuzzing sanitizer https://www.llvm.org/docs/LibFuzzer.html"
        )
        add_subdirectory(fuzz_test)
endif()

add_subdirectory(src)

option(ENABLE_UNITY "Enable Unity builds of projects" OFF)
if(ENABLE_UNITY)
        # Add for any project you want to apply unity builds for
        set_target_properties(intro PROPERTIES UNITY_BUILD ON)
endif()
