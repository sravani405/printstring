#include <stdio.h>
#include <dll.h>

int add_entries(struct dll *list, int count)
{
	int i;

	for(i = 0; i < count; i++) {
		dll_append(list, "hello");
		printf("add entry number %d\n", i);
	}

	return 0;
}

int main(int argc, char** argv)
{
	struct dll *list;

	(void) argc;
	(void) argv;

	list = dll_new();

	printf("%s version %s\n", argv[0], VERSION);

	add_entries(list, 10);

	return 0;
}
