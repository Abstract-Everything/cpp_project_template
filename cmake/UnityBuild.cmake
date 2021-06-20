option(ENABLE_UNITY "Enable Unity builds of projects" OFF)

function(enable_unitybuild project_name)
        if(ENABLE_UNITY)
                # Add for any project you want to apply unity builds for
                set_target_properties(${project_name} PROPERTIES UNITY_BUILD ON)
        endif()
endfunction()
