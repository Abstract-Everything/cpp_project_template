function(enable_sanitizers project_name)

	if(NOT
	   (CPP_PROJECT_TEMPLATE_USING_CLANG
	    OR CPP_PROJECT_TEMPLATE_USING_GCC))
		return()
	endif()

	option(CPP_TMPL_ANALYZE_COVERAGE "Enable coverage reporting for gcc/clang" FALSE)
	option(CPP_TMPL_SANITIZER_ADDRESS "Enable address sanitizer" FALSE)
	option(CPP_TMPL_SANITIZER_LEAK "Enable leak sanitizer" FALSE)
	option(CPP_TMPL_SANITIZER_UB "Enable undefined behavior sanitizer" FALSE)
	option(CPP_TMPL_SANITIZER_THREAD "Enable thread sanitizer" FALSE)
	option(CPP_TMPL_SANITIZER_MEMORY "Enable memory sanitizer" FALSE)

	if(${CPP_TMPL_ANALYZE_COVERAGE})
		target_compile_options(
			${project_name}
			INTERFACE --coverage -O0 -g)
		target_link_libraries(
			${project_name}
			INTERFACE --coverage)
	endif()

	set(SANITIZERS
	    "")
	if(${CPP_TMPL_SANITIZER_ADDRESS})
		list(APPEND SANITIZERS "address")
	endif()

	if(${CPP_TMPL_SANITIZER_LEAK})
		list(APPEND SANITIZERS "leak")
	endif()

	if(${CPP_TMPL_SANITIZER_UB})
		list(APPEND SANITIZERS "undefined")
	endif()

	if(${CPP_TMPL_SANITIZER_THREAD})
		if("address" IN_LIST SANITIZERS
		   OR "leak" IN_LIST SANITIZERS)
			message(
				WARNING
					"Thread sanitizer does not work with Address and Leak sanitizer enabled"
			)
		else()
			list(APPEND SANITIZERS "thread")
		endif()
	endif()

	if(${CPP_TMPL_SANITIZER_MEMORY}
	   AND CPP_PROJECT_TEMPLATE_USING_CLANG)
		if("address" IN_LIST SANITIZERS
		   OR "thread" IN_LIST SANITIZERS
		   OR "leak" IN_LIST SANITIZERS)
			message(
				WARNING
					"Memory sanitizer does not work with Address, Thread and Leak sanitizer enabled"
			)
		else()
			list(APPEND SANITIZERS "memory")
		endif()
	endif()

	list(JOIN SANITIZERS "," LIST_OF_SANITIZERS)

	if(LIST_OF_SANITIZERS
	   AND NOT ${LIST_OF_SANITIZERS} STREQUAL "")
		target_compile_options(
			${project_name}
			INTERFACE -fsanitize=${LIST_OF_SANITIZERS})
		target_link_options(${project_name} INTERFACE -fsanitize=${LIST_OF_SANITIZERS})
	endif()

endfunction()
