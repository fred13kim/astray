/**
 * startup.S
 */

/* ---------------------------------------- */

    .syntax unified
    .cpu cortex-m4
    .thumb

/* ---------------------------------------- */

    .global     SysInit
    .global     Reset_Handler
    .global     Default_Handler
    .global     Vectors

/* ---------------------------------------- */
    .section    .text.SysInit
    .type       SysInit, %function

SysInit:
    /* Not relocating vector table */
    /* Not using fpu */
    /* Not configuring system clock yet */
    bx      lr

.size   SysInit, .-SysInit

/* ---------------------------------------- */

    .section    .text.Reset_Handler
    .type       Reset_Handler, %function

Reset_Handler:
    ldr     sp, =_mstack /* LOAD main stack address into stack pointer */
    bl      SysInit

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

    bl      main
    bx      lr

.size   Reset_Handler, .-Reset_Handler

/* ---------------------------------------- */
    .section    .text.Default_Handler

Default_Handler:
Infinite_Loop:
    b  Infinite_Loop

.size  Default_Handler, .-Default_Handler


/* ---------------------------------------- */

    .section    .isr_vector, "a", %progbits
    .type       Vectors, %object

/* Defined in B1.5.2 of ARMv7-M Ref */
/*                                  ADDR    */
Vectors:
    .word   _mstack                 //x000
    .word   Reset_Handler           //x004
    .word   NMI_Handler             //x008
    .word   HardFault_Handler       //x00c
    .word   MemManage_Handler       //x010
    .word   BusFault_Handler        //x014
    .word   UsageFault_Handler      //x018
    .word   0                       //x01c
    .word   0                       //x020
    .word   0                       //x024
    .word   0                       //x028
    .word   SVC_Handler             //x02c
    .word   DebugMon_Handler        //x030
    .word   0                       //x034
    .word   PendSV_Handler          //x038
    .word   SysTick_Handler         //x03c
    .word   _IRQ_Handler            //x040

.size   Vectors, .-Vectors

    .weak       NMI_Handler
    .thumb_set  NMI_Handler, Default_Handler

    .weak       HardFault_Handler
    .thumb_set  HardFault_Handler, Default_Handler

    .weak       MemManage_Handler
    .thumb_set  MemManage_Handler, Default_Handler

    .weak       BusFault_Handler
    .thumb_set  BusFault_Handler, Default_Handler

    .weak       UsageFault_Handler
    .thumb_set  UsageFault_Handler, Default_Handler

    .weak       SVC_Handler
    .thumb_set  SVC_Handler, Default_Handler

    .weak       DebugMon_Handler
    .thumb_set  DebugMon_Handler, Default_Handler

    .weak       PendSV_Handler
    .thumb_set  PendSV_Handler, Default_Handler

    .weak       SysTick_Handler
    .thumb_set  SysTick_Handler, Default_Handler

    .weak       _IRQ_Handler
    .thumb_set  _IRQ_Handler, Default_Handler
