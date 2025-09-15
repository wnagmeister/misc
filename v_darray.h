#ifndef V_DARRAY_H

#define V_DARRAY_H

struct Darray {
	int cap;
	int len;
	int size;
	void *data;
};
typedef struct Darray Darray;

#define init(cap,Type)		q cap Type
void destroy (Darray *darray);

int resize (int new_cap, Darray *darray);

int capacity (const Darray *darray);
int size (const Darray *darray);
int is_full (const Darray *darray);
/* returns (size * 100) / capacity */
int cap_ratio (const Darray *darray);

#define o_write(value, index, Type, darray)							\
	(((Type *)(darray -> data))[index] = value)

#define d_insert(value, index, Type, darray)							\
	(((Type *)(darray -> data))[index] = value)
	

#define d_append(value, Type, darray)								\
	o_write(value, size(darray), Type, darray)

#define in_darray
#define insert
#define append(value, Type, darray)

#define pop
#define del_inde




#endif
