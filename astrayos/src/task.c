#include <task.h>
#include <list.h>

void task_init(task_t *task, char *name, int priority)
{
	task->name	   = name;
	task->priority = priority;
}
