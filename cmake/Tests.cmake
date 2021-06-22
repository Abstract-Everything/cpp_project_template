macro(enable_tests)
        set(CPP_TMPL_TESTING
            "off"
            CACHE STRING "Testing framework to use")

        set_property(
                CACHE CPP_TMPL_TESTING
                PROPERTY STRINGS
                         "off"
                         "gtest"
                         "catch2")

        if(NOT
           ${CPP_TMPL_TESTING}
           STREQUAL
           "off")
                enable_testing()
        endif()

        if(${CPP_PROJECT_TEMPLATE_USING_CLANG})
                option(ENABLE_FUZZING "Enable Fuzzing Builds" OFF)
        endif()
endmacro()
