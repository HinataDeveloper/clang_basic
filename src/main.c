#include <stdio.h>

/* C = (5/9) * (F - 32) */
int main(void)
{
	int fahrenheit;
	int celsius;
	int lower;
	int upper;
	int step;

	lower = 0; /* lower limit of temperature scale */
	upper = 300; /* upper limit */
	step = 20; /* step size */

	fahrenheit = lower;
	while (fahrenheit <= upper) {
		celsius = 5 * (fahrenheit - 32) / 9;
		printf("%d\t%d\n", fahrenheit, celsius);
		fahrenheit = fahrenheit + step;
	}

	return 0;
}
