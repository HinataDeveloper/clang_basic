#include <stdio.h>

int main(void)
{
	char ch;

	ch = getchar();
	while (ch != EOF) {
		putchar(ch);
		ch = getchar();
	}

	puts("\n The End ...\n");
	return 0;
}
