#include <stdio.h>

int main(void)
{
	FILE *file;
	file = fopen("LICENSE1", "r");
	if (file == NULL) {
		perror("--->>> file not found \n");
		return -1;
	}

	int read;
	while ((read = getc(file)) != EOF) {
		fputc(read, stdout);
	}

	fclose(file);

	puts("\n The End ...\n");
	return 0;
}
