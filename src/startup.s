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

Vectors:
    .word   _mstack
    .word   Reset_Handler
    .word   NMI_Handler
    .word   HardFault_Handler

    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
