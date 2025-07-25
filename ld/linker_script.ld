ENTRY(Reset_Handler)

MEMORY {
    flash (rx)  : ORIGIN = 0x08000000, LENGTH = 512K
    sram (rwx)  : ORIGIN = 0x20000000, LENGTH = 128K
}

_mstack = ORIGIN(flash) + LENGTH(sram);

SECTIONS {
    .isr_vector : {
        . = ALIGN(4);
        KEEP(*(.isr_vector)) /* Startup code */
        . = ALIGN(4);
    } > flash

    .text : {
        . = ALIGN(4);
        *(.text*)
        . = ALIGN(4);
    } > flash

    .data : {
        . = ALIGN(4);
        *(.data*)
        . = ALIGN(4);
    } > sram AT > flash

    .bss : {
        . = ALIGN(4);
        *(.bss*)
        . = ALIGN(4);
    } > sram
}
