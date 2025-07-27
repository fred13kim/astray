#include "astrayos.h"
#include "core.h"

void SysTick_Handler(void)
{
	uint32_t val = SYSTICK->VAL;
	(void)val;
}

void ASTRAYOS_init(void)
{
	/**
     * Initialize systick
     */

	/* Load the reload value */
	SYSTICK->RVR = ((SYS_CLK_FREQ / 10UL) - 1UL) & SYSTICK_RVR_RELOAD_MASK;

	/* Enable systick timer with processor clk & pending interrupts enabled */
	SYSTICK->CSR = SYSTICK_CSR_CLKSRC | SYSTICK_CSR_TICKINT | SYSTICK_CSR_EN;
}
