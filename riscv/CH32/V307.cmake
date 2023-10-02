set(MCU_ARCH cortex-m7)
set(MCU_FLOAT_ABI softfp)
set(MCU_FPU fpv4-sp-d16)

set(COMMON_COMPILE_FLAGS -mabi=ilp32f -mcmodel=medany -msmall-data-limit=8 -mno-save-restore)
set(C_CXX_COMPILE_FLAGS  -ffunction-sections -fdata-sections -fsigned-char -g -fmessage-length=0)

if(NOT (TARGET CH32::V307))
    add_library(CH32::V307 INTERFACE IMPORTED)

    target_compile_options(CH32::V307 INTERFACE 
        --sysroot="${TOOLCHAIN_SYSROOT}"
        ${COMMON_COMPILE_FLAGS}
    )

    #target_compile_options(CH32::V307 INTERFACE $<$<COMPILE_LANGUAGE:ASM>:-x assembler-with-cpp>)
    target_compile_options(CH32::V307 INTERFACE $<$<COMPILE_LANGUAGE:C>:${C_CXX_COMPILE_FLAGS}>)
    target_compile_options(CH32::V307 INTERFACE $<$<COMPILE_LANGUAGE:CXX>:${C_CXX_COMPILE_FLAGS}>)
    target_compile_options(CH32::V307 INTERFACE $<$<COMPILE_LANGUAGE:CXX>:-fno-exceptions -fno-rtti -fno-use-cxa-atexit -fno-threadsafe-statics>)

    target_compile_options(CH32::V307 INTERFACE -march=rv32imafc -mabi=ilp32f -mcmodel=medany -msmall-data-limit=8 -mno-save-restore)
    target_compile_options(CH32::V307 INTERFACE -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -fsingle-precision-constant)
    

    target_link_options(CH32::V307 INTERFACE 
        --sysroot="${TOOLCHAIN_SYSROOT}"
        ${COMMON_COMPILE_FLAGS}
        ${C_CXX_COMPILE_FLAGS}         
    )
endif()