#include <stdio.h>

/* C = (5/9) * (F - 32) */
int main(void)
{
	int fahr;
	int celsiuse;
	int lower;
	int upper;
	int step;

	lower = 0; /* lower limit of temprature scale */
	upper = 300; /* upper limit */
	step = 20; /* step size */

	fahr = lower;
	while (fahr <= upper) {
		celsiuse = 5 * (fahr - 32) / 9;
		printf("%d\t%d\n", fahr, celsiuse);
		fahr = fahr + step;
	}

	return 0;
}
