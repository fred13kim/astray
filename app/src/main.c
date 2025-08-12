#include <astrayos.h>
#include <stdbool.h>

char word[] = "word";
int	 a, b, c, d;

/**
 * Main application should "start" our RTOS
 */
int main(void)
{
	task_t task_a;
	task_init(&task_a, "Task A", 1);

	task_t task_b;
	task_init(&task_b, "Task B", 2);

	sched_add_task(&task_a);
	sched_add_task(&task_b);

	while (true) {
	}

	return 0;
}
