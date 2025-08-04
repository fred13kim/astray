#ifndef LIST_H
#define LIST_H

#include <stddef.h>


struct list_head {
	struct list_head *next, *prev;
};

static inline void init_list_head(struct list_head *list)
{
	list->next = list;
	list->prev = list;
}

static inline void __list_add(struct list_head *new, struct list_head *prev,
							  struct list_head *next)
{
    next->prev = new;
    new->next = next;
    new->prev = prev;
    prev->next = new;
}

static inline void list_add(struct list_head *new, struct list_head *head)
{
    __list_add(new, head, head->next);
}

static inline void list_add_tail(struct list_head *new, struct list_head *head)
{
    __list_add(new, head->prev, head);
}

static inline void __list_del(struct list_head *prev, struct list_head *next) {
    next->prev = prev;
    prev->next = next;
}

static inline void __list_del_entry(struct list_head *entry) {
    // Should check if you can delete the entry?
    __list_del(entry->prev, entry->next);
}

static inline void list_del(struct list_head *entry) {
    __list_del_entry(entry);
    entry->next = NULL;
    entry->prev = NULL;
}

#endif // !LIST_H
