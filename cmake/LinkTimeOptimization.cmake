macro(enable_ipo)
        option(
                ENABLE_IPO
                "Enable Interprocedural Optimization, aka Link Time Optimization (LTO)"
                OFF)

        if(ENABLE_IPO)
                include(CheckIPOSupported)
                check_ipo_supported(RESULT result OUTPUT output)
                if(result)
                        set(CMAKE_INTERPROCEDURAL_OPTIMIZATION TRUE)
                else()
                        message(SEND_ERROR "IPO is not supported: ${output}")
                endif()
        endif()
endmacro()
