#ifndef LIST_H
#define LIST_H

#include <stddef.h>

typedef struct ll_node_s {
	struct ll_node_s *prev, *next;
} ll_node_t;

static inline void ll_list_init(ll_node_t *head)
{
	head->prev = head;
	head->next = head;
}

static inline void ll_list_add(ll_node_t *head, ll_node_t *node)
{
	head->next->prev = node;
	node->next		 = head->next;
	node->prev		 = head;
	head->next		 = node;
}

static inline void ll_list_add_tail(ll_node_t *head, ll_node_t *node)
{
	head->prev		 = node;
	node->next		 = head;
	node->prev		 = head->prev;
	head->prev->next = node;
}

static inline void ll_list_del(ll_node_t *node)
{
	node->next->prev = node->prev;
	node->prev->next = node->next;
	node->next		 = NULL;
	node->prev		 = NULL;
}

#endif // !LIST_H
