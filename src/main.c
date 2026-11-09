#include <stdio.h>

#define Z (32.0)
#define W (5.0 / 9.0)
#define CELSIUS(f) (W * (f - Z))

#define LOWER (0.0)
#define UPPER (300.0)
#define STEP (20.0)

/* C = (5/9) * (F - 32) */
/* Print Fahrenheit-Celsius table */
int main(void)
{
	printf(" -> Fahrenheit\tCelsius\n");
	for (double fahrenheit = LOWER; fahrenheit <= UPPER;
	     fahrenheit = fahrenheit + STEP) {
		printf(" -> %7.2lf\t%7.2lf\n", fahrenheit, CELSIUS(fahrenheit));
	}

	return 0;
}
