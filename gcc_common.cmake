
if(NOT (TARGET GCC::Specs::NoSys))
    add_library(GCC::Specs::NoSys INTERFACE IMPORTED)
    target_link_options(GCC::Specs::NoSys INTERFACE 
        -specs=nosys.specs
    )
endif()

if(NOT (TARGET GCC::Specs::Nano))
    add_library(GCC::Specs::Nano INTERFACE IMPORTED)
    target_link_options(GCC::Specs::Nano INTERFACE 
        -specs=nano.specs
    )
endif()

function(gcc_add_linker_script TARGET VISIBILITY SCRIPT_PATH)
    message("Link: ${SCRIPT_PATH}")
    get_filename_component(SCRIPT_PATH "${SCRIPT_PATH}" ABSOLUTE)
    target_link_options(${TARGET} ${VISIBILITY} -T "${SCRIPT_PATH}")
endfunction()
