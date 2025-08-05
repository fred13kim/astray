#include <astrayos.h>

char word[] = "word";
int	 a, b, c, d;

/**
 * Main application should "start" our RTOS
 */
int main(void)
{
	ASTRAYOS_init();

	ll_node_t tasks;
	ll_list_init(&tasks);


	task_t task_a;
	task_init(&task_a, "Task A", 1);

	task_t task_b;
	task_init(&task_b, "Task B", 2);

	ll_list_add(&tasks, &task_a.node);
	ll_list_add(&tasks, &task_b.node);

	while (1) {
		;
		;
	}
	return 0;
}
