#ifndef TASK_H
#define TASK_H
#include <list.h>

typedef struct task_s {
	char	 *name;
	int		  priority;
	ll_node_t node;
} task_t;

void task_init(task_t *task, char *name, int priority);

#endif // !TASK_H
