#include "astrayos.h"
#include "core.h"

void SysTick_Handler(void)
{
	uint32_t val = SYSTICK->VAL;
	(void)val;
}

void ASTRAYOS_init(void)
{
	/* Initialize systick */
	/* CTRL bits reset to 0 */
	SYSTICK->LOAD = (SYS_CLK_FREQ / 10UL) - 1UL;

	SYSTICK->CTRL = (1UL << 2) | (1UL << 1) | (1UL << 0);
}
