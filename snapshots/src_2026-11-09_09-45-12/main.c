#include <stdio.h>

#define Z (32.0)
#define W (5.0 / 9.0)
#define CELSIUS(f) (W * (f - Z))

/* C = (5/9) * (F - 32) */
/* Print Fahrenheit-Celsius table */
int main(void)
{
	double fahrenheit = 75.0;
	// double celsius = 0.0;

	printf("Celsius Degree is: %lf\n", CELSIUS(fahrenheit));

	return 0;
}
