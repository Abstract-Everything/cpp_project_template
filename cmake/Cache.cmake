function(enable_ccache)
	set(CACHE_OPTION
	    "ccache"
	    CACHE STRING "Compiler cache to be used")
	set_property(
		CACHE CACHE_OPTION
		PROPERTY STRINGS
			 "off"
			 "ccache"
			 "sccache")

	if(CACHE_OPTION STREQUAL "off")
		return()
	endif()

	find_program(CACHE_BINARY ${CACHE_OPTION})
	if(NOT CACHE_BINARY)
		message(FATAL_ERROR "${CACHE_OPTION} is enabled but was not found")
		return()
	endif()

	message(STATUS "${CACHE_OPTION} found and enabled")
	set(CMAKE_CXX_COMPILER_LAUNCHER ${CACHE_BINARY})
endfunction()
