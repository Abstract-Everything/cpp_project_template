set(CPP_PROJECT_TEMPLATE_USING_MSVC
    FALSE)
set(CPP_PROJECT_TEMPLATE_USING_CLANG
    FALSE)
set(CPP_PROJECT_TEMPLATE_USING_GCC
    FALSE)

if(${CMAKE_CXX_COMPILER_ID} STREQUAL "MSVC")
	set(CPP_PROJECT_TEMPLATE_USING_MSVC
	    TRUE)
elseif(${CMAKE_CXX_COMPILER_ID} MATCHES "Clang")
	set(CPP_PROJECT_TEMPLATE_USING_CLANG
	    TRUE)
elseif(${CMAKE_CXX_COMPILER_ID} STREQUAL "GNU")
	set(CPP_PROJECT_TEMPLATE_USING_GCC
	    TRUE)
endif()
