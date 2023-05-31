---
title: General Debugging
author: Johnson Laguerre
---

One of the classic debugging approaches is print-based debugging. Strategically-placed print statements let you see what is happening in your program at "critical" points in time and can help you pinpoint where your program is going wrong.

Below, we will take a look at some examples of print-based debugging helping us locate errors.

# Example A: Alarming Arrays.

``` c
#include <stdio.h>

int main(void)
{
    int array1[10];
    int array2[10];
    int n = 10;

    // Initialize array1 with 5 and array2 with 10.
    for (int i = 1; i <= n; i++)
    {
        array2[i] = 10;
        array1[i] = 5;
    }

    // Print all the array values.
    for (int i = 1; i <= n; i++)
    {
        printf("array1[%d] = %d\n", i, array1[i]);
    }
	
	printf("\n");
	
    for (int i = 1; i <= n; i++)
    {
        printf("array2[%d] = %d\n", i, array2[i]);
    }

    return 0;
}
```

``` {.terminal}
array1[1] = 5
array1[2] = 5
array1[3] = 5
array1[4] = 5
array1[5] = 5
array1[6] = 5
array1[7] = 5
array1[8] = 5
array1[9] = 5
array1[10] = 5

array2[1] = 10
array2[2] = 10
array2[3] = 10
array2[4] = 10
array2[5] = 10
array2[6] = 10
array2[7] = 10
array2[8] = 10
array2[9] = 10
array2[10] = 10
*** stack smashing detected ***: terminated
Aborted
```

Stack smashing? Where did *that* come from?

The problem here is due to an off-by-one error. While we *did* declare arrays of length 10, arrays are zero-indexed, meaning the initial element is found at index 0. The final loop gave us an error because we read past the bounds of the array, trying to access memory that doesn't belong to the array.

We can fix this by setting all of our loops to start at 0 and run while they are less than 10 (i.e., we only access indexes 0-9).

<!-- Preference for indexes vs. indices?-->

``` c
#include <stdio.h>

int main(void)
{
   int array1[10];
    int array2[10];
    int n = 10;

    // Initialize array1 with 5 and array2 with 10.
    for (int i = 0; i < n; i++)
    {
        array1[i] = 5;
        array2[i] = 10;
    }

    // Print all the array values.
    for (int i = 0; i < n; i++)
    {
        printf("array1[%d] = %d\n", i, array1[i]);
    }
	
	printf("\n");
	
    for (int i = 0; i < n; i++)
    {
        printf("array2[%d] = %d\n", i, array2[i]);
    }
	
	return 0;
}
```

Running that code, we see that the error has gone away.

``` {.terminal}
array1[0] = 5
array1[1] = 5
array1[2] = 5
array1[3] = 5
array1[4] = 5
array1[5] = 5
array1[6] = 5
array1[7] = 5
array1[8] = 5
array1[9] = 5

array2[0] = 10
array2[1] = 10
array2[2] = 10
array2[3] = 10
array2[4] = 10
array2[5] = 10
array2[6] = 10
array2[7] = 10
array2[8] = 10
array2[9] = 10
```

One important thing to note: the stack smashing error occurred only on the *last* loop. The lesson here is that off-by-one errors won't always cause issues immediately, so your program could fail unexpectedly long after a mistake was made. Be careful with the values you use as your start and end arguments, and check whether or not you want to reach your end argument (e.g., <=, >= vs. <, >).

# Example B: Bothersome Bananas.

``` c
#include <stdio.h>

int main(void)
{
    int i;
    char name[100] = "banana";

    // This should print the name as a grid with 5 rows like:
    // b a n a n a
    // b a n a n a
    // b a n a n a
    // b a n a n a
    // b a n a n a

    for (i = 0; i < 5; i++)
    {
        for (i = 0; i < 100; i++)
        {
            printf("%c ", name[i]);
        }
        printf("\n");
    }

    return 0;
}
```

``` {.terminal}
b a n a n a
```

Hey, what gives? I wanted five bananas, not one!

If we look a little closer, we'll notice that we're using `i` for both for loops. This means when the inner loop ends, `i` is at 100, causing the condition for the outer loop, `i < 5`, to evaluate to false and terminate the loop.

If we want to see all five bananas, we need to use a separate variable for the inner loop. Here, we'll use `j` as the new counter.

``` c
#include <stdio.h>

int main(void)
{
	int i, j;
    char name[100] = "banana";

    // This should print the name as a grid with 5 rows like:
    // b a n a n a
    // b a n a n a
    // b a n a n a
    // b a n a n a
    // b a n a n a
	
    for (i = 0; i < 5; i++)
    {
        for (j = 0; j < 100; j++)
        {
            printf("%c ", name[j]);
        }
        printf("\n");
    }
	
	return 0;
}
```

If we run that, we get our expected result:

``` {.terminal}
b a n a n a
b a n a n a
b a n a n a
b a n a n a
b a n a n a
```

# Example C: Chaotic Change.

``` c
#include <stdio.h>

int main(void)
{
    double change;
    int dollars, quarters, dimes, nickels, pennies;

    printf("Enter the amount of change: ");
    scanf("%lf", &change);

    while (change != 0)
    {
        if (change >= 1)
        {
            dollars++;
            change -= 1;
        }
        else if (change >= 0.25)
        {
            quarters++;
            change -= 0.25;
        }
        else if (change >= 0.10)
        {
            dimes++;
            change -= 0.10;
        }
        else if (change >= 0.05)
        {
            nickels++;
            change -= 0.05;
        }
        else if (change >= 0.01)
        {
            pennies++;
            change -= 0.01;
        }
    }

    printf("%d Dollars\n", dollars);
    printf("%d Quarters\n", quarters);
    printf("%d Dimes\n", dimes);
    printf("%d Nickels\n", nickels);
    printf("%d Pennies\n", pennies);

    return 0;
}
```

``` {.terminal}
Enter the amount of change: 4.39

```

Why isn't my program printing anything?

(Mention initializing variables to zero?)

(Loop gets stuck on the "else if (change >= 0.01)" condition and won't continue subtracting.)

(Explanation and edited code)

``` c

```

(New output)

``` {.terminal}

```

(End of file)
