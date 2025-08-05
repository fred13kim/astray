/**
 * sys.s
 */

/* ---------------------------------------- */

    .syntax unified
    .cpu cortex-m4
    .thumb

/* ---------------------------------------- */

    .global     SysInit

/* ---------------------------------------- */

    .section    .text.SysInit
    .type       SysInit, %function

SysInit:
    /* Not relocating vector table */
    /* Not using fpu */
    /* Not configuring system clock yet */
    bx      lr

.size   SysInit, .-SysInit
