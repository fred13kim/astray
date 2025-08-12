#ifndef SCHED_H
#define SCHED_H
#include <task.h>

int sched_init(void);
int sched_add_task(task_t *task);

#endif // !SCHED_H
