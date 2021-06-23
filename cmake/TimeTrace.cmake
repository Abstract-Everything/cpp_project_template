# Enables options for clang time trace if available
function(enable_time_trace project)
	if(NOT ${CPP_PROJECT_TEMPLATE_USING_CLANG})
		return()
	endif()

	option(ENABLE_BUILD_WITH_TIME_TRACE
	       "Enable -ftime-trace to generate time tracing .json files on clang" OFF)
	if(ENABLE_BUILD_WITH_TIME_TRACE)
		target_compile_options(
			${project}
			INTERFACE -ftime-trace)
	endif()
endfunction()
