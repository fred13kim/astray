/**
 * Address map of the private peripheral bus (PPB)
 */

#ifndef CORE_PERIPHS_H
#define CORE_PERIPHS_H

#include <stdint.h>

/* General Macros */

#define __RW volatile
#define __WO volatile
#define __RO const volatile

/* Clock */
#define HSI_CLK_FREQ 16000000
#define SYS_CLK_FREQ HSI_CLK_FREQ

/* Register map */

#define ITM_BASE     (0xE0000000UL)        /* Instruction Trace Macrocell */
#define DWT_BASE     (0xE0001000UL)        /* Data Watchpoint and Trace */
#define FPB_BASE     (0xE0002000UL)        /* Flashpatch and Breakpoint */
#define SCS_BASE     (0xE000E000UL)        /* System Control Space */
#define SYSTICK_BASE (SCS_BASE + 0x0010UL) /* System Timer */
#define NVIC_BASE    (SCS_BASE + 0x0100UL) /* Nested Vector Interrupt Controller */
#define SCB_BASE     (SCS_BASE + 0x0D00UL) /* System Control Block */

/* SYSTICK Register map */

#define SYSTICK ((SYSTICK_T *)SYSTICK_BASE)

typedef struct {
	__RW uint32_t CSR;
	__RW uint32_t RVR;
	__RW uint32_t CVR;
	__RO uint32_t CALIB;
} SYSTICK_T;

#define SYSTICK_CSR_CLKSRC      (1UL << 2)
#define SYSTICK_CSR_TICKINT     (1UL << 1)
#define SYSTICK_CSR_EN          (1UL << 0)
#define SYSTICK_RVR_RELOAD_MASK ((1UL << 24) - 1UL)

#endif // !CORE_PERIPHS_H
