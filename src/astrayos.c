#include "astrayos.h"
#include "core.h"

void SysTick_Handler(void)
{
	uint32_t val = SYSTICK->CVR;
	(void)val;
}

uint32_t ASTRAYOS_SYSTICK_init(uint32_t ticks)
{
	if ((ticks - 1UL) > SYSTICK_RVR_RELOAD_MASK) {
		return 1;
	}
	/**
     * Initialize systick
     */

	/* SYSTICK should and is disabled by default */

	/* Load the reload value */
	SYSTICK->RVR = ((SYS_CLK_FREQ / 10UL) - 1UL);

	/* Clear the systick timer */
	SYSTICK->CVR = 0UL;

	/* Enable systick timer with processor clk & pending interrupts enabled */
	SYSTICK->CSR = SYSTICK_CSR_CLKSRC | SYSTICK_CSR_TICKINT | SYSTICK_CSR_EN;

	return 0;
}

void ASTRAYOS_init(void)
{
	/* Initialize systick period to 1 ms */
	ASTRAYOS_SYSTICK_init(SYS_CLK_FREQ / 1000UL);
}
