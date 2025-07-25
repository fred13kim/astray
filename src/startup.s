/**
 * startup.S
 */

    .syntax unified
    .cpu cortex-m4
    .thumb

/* ---------------------------------------- */

    .global     Vectors
    .global     Reset_Handler

/* ---------------------------------------- */

    .section    .text.Reset_Handler
    .type       Reset_Handler, %function

Reset_Handler:
    ldr sp, =_mstack /* LOAD main stack address into stack pointer */

/* ---------------------------------------- */

    .section    .isr_vector

/* Defined in B1.5.2 of ARMv7-M Ref */
/*                                  ADDR    */
Vectors:
    .word   _mstack                 //x00
    .word   Reset_Handler           //x04
    .word   NMI_Handler             //x08
    .word   HardFault_Handler       //x0c
    .word   MemManage_Handler       //x10
    .word   BusFault_Handler        //x14
    .word   UsageFault_Handler      //x18
    .word   0                       //x1c
    .word   0                       //x20
    .word   0                       //x24
    .word   0                       //x28
    .word   SVC_Handler             //x2c
    .word   DebugMon_Handler        //x30
    .word   0                       //x34
    .word   PendSV_Handler          //x38
    .word   SysTick_Handler         //x3c
