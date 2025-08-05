ENTRY(Reset_Handler)

MEMORY {
    flash (rx)  : ORIGIN = 0x08000000, LENGTH = 512K
    sram (rwx)  : ORIGIN = 0x20000000, LENGTH = 128K
}

_mstack = ORIGIN(sram) + LENGTH(sram);

SECTIONS {
    .isr_vector : {
        . = ALIGN(4);
        KEEP(*(.isr_vector)) /* Startup code */
        . = ALIGN(4);
    } > flash

    .text : {
        . = ALIGN(4);
        *(.text)
        *(.text*)
        . = ALIGN(4);
    } > flash

    .rodata : {
        . = ALIGN(4);
        *(.rodata)
        *(.rodata*)
        . = ALIGN(4);
    } > flash


    .data : {
        . = ALIGN(4);
        _sdata = .;
        *(.data)
        *(.data*)
        . = ALIGN(4);
        _edata = .;
    } > sram AT > flash

    /**
     * VMA lives in flash and LMA lives in sram
     * In this context we are LOADING the LMA address into sidata so we can copy
     * the data such as global initialized variables from flash VMA into sram LMA
     */

    _sidata = LOADADDR(.data);

    .bss : {
        . = ALIGN(4);
        _sbss = .;
        *(.bss)
        *(.bss*)
        . = ALIGN(4);
        _ebss = .;
    } > sram
}
