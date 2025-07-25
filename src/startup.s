/**
 * startup.S
 */

/* ---------------------------------------- */

    .syntax unified
    .cpu cortex-m4
    .thumb

/* ---------------------------------------- */

    .global     SystemInit
    .global     Reset_Handler
    .global     Vectors

/* ---------------------------------------- */
    .section    .text.SystemInit
    .type       SystemInit, %function

SystemInit:
    /* Not relocating vector table */
    /* Not using fpu */
    /* Not configuring system clock yet */
    bx      lr

/* ---------------------------------------- */

    .section    .text.Reset_Handler
    .type       Reset_Handler, %function

Reset_Handler:
    ldr     sp, =_mstack /* LOAD main stack address into stack pointer */
    bl      SystemInit

    /* Copy initialized data from VMA data (flash) to LMA idata (sram) */

    ldr     r0, =_sdata
    ldr     r1, =_edata
    ldr     r2, =_sidata

    b       CopyData

CopyData:
    cmp     r0, r1
    itt     lo
    ldrlo   r3, [r0], #4 /* Index src pointer */
    strlo   r3, [r2], #4 /* Index dst pointer */
    blo     CopyData

    ldr     r0, =_sbss
    ldr     r1, =_ebss
    movs    r2, #0

    b       ZeroBss

ZeroBss:
    cmp     r0,r1
    it      lo
    strlo   r2, [r0], #4
    blo     ZeroBss

    bl main
    bx lr






/* ---------------------------------------- */

    .section    .isr_vector
    .type       Vectors, %object

/* Defined in B1.5.2 of ARMv7-M Ref */
/*                                  ADDR    */
Vectors:
    .word   _mstack                 //x000
    .word   Reset_Handler           //x004
    # .word   NMI_Handler             //x008
    # .word   HardFault_Handler       //x00c
    # .word   MemManage_Handler       //x010
    # .word   BusFault_Handler        //x014
    # .word   UsageFault_Handler      //x018
    .word   0                       //x01c
    .word   0                       //x020
    .word   0                       //x024
    .word   0                       //x028
    # .word   SVC_Handler             //x02c
    # .word   DebugMon_Handler        //x030
    .word   0                       //x034
    # .word   PendSV_Handler          //x038
    # .word   SysTick_Handler         //x03c
    # .word   _IRQ_Handler           //x040
