function(enable_pch)
	# Very basic PCH example
	option(CPP_TMPL_COMPILE_PCH "Enable Precompiled Headers" OFF)
	if(${CPP_TMPL_COMPILE_PCH})
		# This sets a global PCH parameter, each project will build its own PCH, which is a
		# good idea if any #define's change
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
endfunction()
