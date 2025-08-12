#include <list.h>
#include <task.h>

ll_node_t list;

int sched_init(void)
{
	ll_list_init(&list);
	return 0;
}

int sched_add_task(task_t *task)
{
	ll_list_add(&list, &task->node);
	return 0;
}
