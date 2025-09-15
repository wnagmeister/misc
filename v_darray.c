#include <stdlib.h>
#include "v_darray.h"

int capacity (const Darray *darray) {
	return darray -> cap;
}

int size (const Darray *darray) {
	return darray -> len;
}

int is_full (const Darray *darray) {
	return (darray -> len >= darray -> cap) ? 1 : 0;
}

int cap_ratio (const Darray *darray) {
	return (darray -> len * 100) / darray -> cap;
}

Darray *init_darray (int cap, int element_size) {
	Darray *p = malloc(sizeof(*p));
	p -> cap = cap;
	p -> len = 0;
	p -> size = element_size;
	p -> data = malloc(cap * element_size);
	return p;
}

void destroy_darray (Darray *darray) {
	free(darray -> data);
	free (darray);
}

int resize (int new_cap, Darray *darray) {
	if (is_full(darray)) {
		darray -> data = realloc(darray -> data, new_cap * darray -> size);
		darray -> cap = new_cap;
		return 0;
	} else {
		return 1;
	}
}


