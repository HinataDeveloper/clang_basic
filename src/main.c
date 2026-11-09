#include <stdio.h>

void print_char(char ch);

int main(void)
{
	printf("You can enter 20 characters at last:\n -> ");

	char ch;
	for (int i = 0; i < 20; ++i) {
		ch = getchar();
		print_char(ch);
	}
	putchar('\n');

	return 0;
}

void print_char(char ch)
{
	if (ch == '\r' || ch == '\n' || ch == '\n')
		return;
	putchar(ch);
	putchar('-');
}
