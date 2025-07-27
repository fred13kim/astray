#include <astrayos.h>

char word[] = "word";
int  a, b, c, d;

/**
 * Main application should "start" our RTOS
 */
int main(void)
{
	ASTRAYOS_init();
	create_task();
	return 0;
}
