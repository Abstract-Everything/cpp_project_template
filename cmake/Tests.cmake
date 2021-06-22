macro(enable_tests)
        option(CPP_TMPL_TESTING "Enable Test Builds" OFF)

        if(${CPP_TMPL_TESTING})
                enable_testing()
        endif()

        if(${CPP_PROJECT_TEMPLATE_USING_CLANG})
                option(ENABLE_FUZZING "Enable Fuzzing Builds" OFF)
        endif()
endmacro()
