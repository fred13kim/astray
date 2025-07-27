/**
 * Address map of the private peripheral bus (PPB)
 */

#ifndef CORE_PERIPHS_H
#define CORE_PERIPHS_H

#include <stdint.h>

#define __RW volatile
#define __WO volatile
#define __RO const volatile

/* Register map */

#define ITM_BASE     (0xE0000000UL) /* Instruction Trace Macrocell */
#define DWT_BASE     (0xE0001000UL) /* Data Watchpoint and Trace */
#define FPB_BASE     (0xE0002000UL) /* Flashpatch and Breakpoint */
#define SCS_BASE     (0xE000E000UL) /* System Control Space */
#define SYSTICK_BASE (SCS_BASE + 0x0010UL) /* System Timer */
#define NVIC_BASE    (SCS_BASE + 0x0100UL) /* Nested Vector Interrupt Controller */
#define SCB_BASE     (SCS_BASE + 0x0D00UL) /* System Control Block */

#define SYSTICK ((SYSTICK_T *)SYSTICK_BASE)

typedef struct {
	__RW uint32_t CTRL;
	__RW uint32_t LOAD;
	__RW uint32_t VAL;
	__RO uint32_t CALIB;
} SYSTICK_T;

#endif // !CORE_PERIPHS_H
