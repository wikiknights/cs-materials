// Idel Martinez
// Fall 2020

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/**
 * Remove carriage return and/or line feed characters from a string.
 */

void remove_crlf(char *s)
{
	char *t = s + strlen(s) - 1;

	while ((t >= s) && (*t == '\n' || *t == '\r'))
	{
		*t = '\0';
		t--;
	}
}

/**
 * Get grades from the user, up to a maximum of 25, and save them in the grades array.
 * Return the number of grades entered.
 */

int get_grades(float *grades, int n)
{
	char buffer[128];
	int amount = 0;

	/**
	 * Start as a do-while loop to avoid repeated code. This way we can save a string inside the buffer and check it later.
	 * If we instead used a while loop and buffer is not initialized, `strcasecmp` will fail. To avoid this, you would have
	 * to use fgets before starting the while loop, but this is the same as using a do-while loop since it always runs once
	 * before checking the loop condition.
	 */
	do
	{
		if (amount >= n) // The amount of grades entered exceeds the maximum number of elements the array can hold.
		{
			printf("You can't enter any more grades, sorry!\n");
			return amount; // Return amount of grades entered, which is 25 since this is our maximum.
		}

		printf("Enter grade %d: ", amount + 1); // Start printing from 1 instead of 0.
		fgets(buffer, 127, stdin);
		remove_crlf(buffer);
		grades[amount++] = atof(buffer); // Save float into array and increment amount by 1.

		/**
		 * Check if user is going to insert another grade. The do-while loop condition below will determine if we can exit or not.
		 */
		printf("Do you want to enter another grade? ");
		fgets(buffer, 127, stdin);
		remove_crlf(buffer);

	} while (strcasecmp(buffer, "yes") == 0 || strcasecmp(buffer, "y") == 0); // Continue or exit out of the loop based on the previous response.

	printf("Awesome! You entered all your grades.\n");

	return amount; // If less than 25 grades were entered, return this amount.
}

/**
 * Print all the grades entered.
 */

void print_grades(float *grades, int n)
{
	/**
	 * For grammatical purposes, check if we should print "grade" or "grades".
	 * Notice the use of the ternary operator, the syntax is: <condition> ? <if_true> : <else>.
	 */
	printf("\nYou entered %d %s. Here is a list of them:\n\n", n, (n == 1) ? "grade" : "grades");

	/**
	 * Print all grades limited to two decimal places.
	 * We format it so that consecutive grades are followed by a space and comma (", "), and
	 * the last grade is followed by a newline character.
	 * Notice again the use of the ternary operator.
	 */
	for (int i = 0; i < n; i++)
	{
		printf("%.2f%s", grades[i], (i + 1>= n) ? "\n\n" : ", ");
	}
}

/**
 * Calculate the sum of grades entered. Then divide it by the number of grades.
 */

void average_grades(float *grades, int n)
{
	float sum = 0; // Initialize to 0 to prevent sum from getting garbage values.

	for (int i = 0; i < n; i++)
	{
		sum += grades[i]; // Sum all the grades.
	}

	/**
	 * Divide the sum by the amount of grades, that is, get the average.
	 */
	printf("Based on the previous grades, the average is: %.2f\n", sum / n);
}

/**
 * Have two variables to check for max and min grades the user entered, then print them out.
 */

void find_max_min(float *grades, int n)
{
	// Time for some fun code!
}

/**
 * Set maximum amount of grades to 25 and start the program.
 */

int main(void)
{
	int amount = 25;
	float grades[amount];

	/**
	 * Overwrite amount by the number of grades the user entered in get_grades.
	 */
	amount = get_grades(grades, amount);

	/**
	 * Now amount is updated with all grades the user entered, so we don't risk reading values in
	 * the grades array that were not initialized to values.
	 */
	print_grades(grades, amount);
	average_grades(grades, amount);
	// find_max_min(grades, amount);

	return 0;
}
