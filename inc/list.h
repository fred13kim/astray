#ifndef LIST_H
#define LIST_H


typedef struct list_entry_s {
	struct list_entry_s *next;
	struct list_entry_s *prev;
	void                *data;
} list_entry_t;

typedef struct list_s {
	list_entry_t *head;
} list_t;


#endif // !LIST_H
