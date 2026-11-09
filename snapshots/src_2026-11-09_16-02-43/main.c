#include <stdio.h>

int main(void)
{
	FILE *file;
	file = fopen("LICENSE", "r");

	int read;
	while ((read = getc(file)) != EOF) {
		fputc(read, stdout);
	}

	puts("\n The End ...\n");
	return 0;
}
