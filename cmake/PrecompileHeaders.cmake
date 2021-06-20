function(enable_pch)
        # Very basic PCH example
        option(ENABLE_PCH "Enable Precompiled Headers" OFF)
        if(ENABLE_PCH)
                # This sets a global PCH parameter, each project will build its
                # own PCH, which is a good idea if any #define's change
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