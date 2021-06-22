option(CPP_TMPL_COMPILE_UNITYBUILD "Enable Unity builds of projects" OFF)

function(enable_unitybuild project_name)
        if(${CPP_TMPL_COMPILE_UNITYBUILD})
                # Add for any project you want to apply unity builds for
                set_target_properties(${project_name} PROPERTIES UNITY_BUILD ON)
        endif()
endfunction()
