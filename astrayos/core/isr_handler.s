/**
 * isr_handler.s
 */

/* ---------------------------------------- */

    .syntax unified
    .cpu cortex-m4
    .thumb

/* ---------------------------------------- */

    .global     SysTick_Handler

/* ---------------------------------------- */

    .section    .text.SysTick_Handler
    .type       SysTick_Handler, %function

SysTick_Handler:
    bx      lr

.size   SysTick_Handler, .-SysTick_Handler
