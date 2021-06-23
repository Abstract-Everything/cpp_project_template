function(enable_time_trace project_name)
	if(NOT ${CPP_PROJECT_TEMPLATE_USING_CLANG})
		return()
	endif()

	option(ENABLE_BUILD_WITH_TIME_TRACE
	       "Enable -ftime-trace to generate time tracing .json files on clang" OFF)
	if(ENABLE_BUILD_WITH_TIME_TRACE)
		target_compile_options(
			${project_name}
			INTERFACE -ftime-trace)
	endif()
endfunction()
