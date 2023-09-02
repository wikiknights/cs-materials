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

    // Initialize all elements of array1 to 5
    // and all elements of array2 to 10.
    for (int i = 1; i <= n; i++)
    {
        array1[i] = 5;
        array2[i] = 10;
    }

    return 0;
}
```

``` {.terminal}
*** stack smashing detected ***: terminated
Aborted
```

"Stack smashing detected"? Where did *that* come from? Hmm, maybe I'll add in a few print statements to see if I can track the problem down.

``` c
#include <stdio.h>

int main(void)
{
    int array1[10];
    int array2[10];
    int n = 10;

    // Initialize all elements of array1 to 5
    // and all elements of array2 to 10.
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

Wait a minute, shouldn't the arrays be starting at index 0? Oh, *now* I see what's going on.

The problem here is due to an off-by-one error. While we *did* declare arrays of length 10, arrays are zero-indexed, meaning the initial element is found at index 0. The final loop gave us an error because we read past the bounds of the array, trying to access memory that doesn't belong to the array.

We can fix this by setting all of our loops to start at 0 and run while they are less than 10 (i.e., we only access indexes 0-9).

``` c
#include <stdio.h>

int main(void)
{
    int array1[10];
    int array2[10];
    int n = 10;

    // Initialize all elements of array1 to 5
    // and all elements of array2 to 10.
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

One important thing to note: the stack smashing error occurred at the *end* of the function. The lesson here is that off-by-one errors won't always cause issues immediately, so your program could fail unexpectedly long after a mistake was made. Be careful with the values you use as your start and end arguments, and check whether or not you want to reach your end argument (e.g., <=, >= vs. <, >).

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

Hey, what gives? I wanted five bananas, not one! Maybe if I take a look at `i`, I'll find a clue.

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
        printf("i = %d\n", i);
        printf("\n");
    }

    return 0;
}
```

``` {.terminal}
b a n a n a                                                                                                                                                                                             i = 100
```

`i = 100`? How did it go from being 0 before the inner loop to 100 afterward? Wait a minute--I'm using `i` to control *both* loops. That means when the inner loop ends, `i` is at 100, causing the condition for the outer loop, `i < 5`, to evaluate to false and end the loop.

If we want to see all five bananas, we need to use a separate variable for the inner loop. Here, we'll use a variable `j` as its counter.

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
    double change = 0.00;
    int dollars = 0, quarters = 0, dimes = 0, nickels = 0, pennies = 0;

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

Why isn't my program printing anything? Maybe something is going wrong inside of the loop? Let me put in a few print statements toward the end of the loop and see what they show.

``` c
#include <stdio.h>

int main(void)
{
    double change = 0.00;
    int dollars = 0, quarters = 0, dimes = 0, nickels = 0, pennies = 0;

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
            printf("pennies = %d\n", pennies);
            printf("change = %0.2lf\n", change);
            pennies++;
            change -= 0.01;
        }
        printf("change = %0.20lf\n", change);
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
change = 3.38999999999999968026
change = 2.38999999999999968026
change = 1.38999999999999968026
change = 0.38999999999999968026
change = 0.13999999999999968026
change = 0.03999999999999967470
pennies = 0
change = 0.04
change = 0.02999999999999967276
pennies = 1
change = 0.03
change = 0.01999999999999967082
pennies = 2
change = 0.02
change = 0.00999999999999967061
change = 0.00999999999999967061
change = 0.00999999999999967061
change = 0.00999999999999967061
change = 0.00999999999999967061
...
```

Okay, so it *is* going inside of the `pennies` statement, but it eventually says there's *less* than one cent left over? How is that possible?

Now would be a good time to discuss floating-point numbers. Floating-point numbers, also known as "real numbers", are numbers that have a fractional portion (e.g., 3.14, 2.37, 1.33, 4.5). Computers represent floating-point numbers in binary, but the representation is not exact.

Just as integers are represented by combining powers of two (e.g., $2^0$, $2^1$, $2^2$, etc.), the fractional portion of numbers are represented by combining the *reciprocals* of powers of two, starting with $1/2^1$ (e.g., $1/2^1$, $1/2^2$, $1/2^3$, etc.).

For example, 13 is 1101 in binary. In other words, it is equal to the sum of $2^3$, $2^2$, and $2^0$. 0.75 is represented by 0.11 in binary and is the sum of $1/2^1$ and $1/2^2$.

However, not all floating-point values can be represented exactly; most are only approximations. As such, comparisons and arithmetic involving floating-point values can produce unexpected and inaccurate results. In our case, the 0.39 cents has an *approximate* representation, so repeated subtraction of 0.01 left a remainder, `0.00999999999999967061`, rather than 0. Since that value is greater than zero but less than 0.01, there is no way to break out of the loop.

One way we can avoid this issue is by moving the decimal points of our input and conditional values further to the right so that we can deal only with integers. Since we care about `change` only to the hundredths place, we can move the decimal point two places to the right by multiplying all of the relevant values by 100.

In addition, we need to ensure the floating-point value will round to the correct integer value. If you look at the output above, you will notice that 0.39 is represented roughly as 0.389, which means that we need to round up to get 0.39 rather than 0.38 cents. A simple integer cast won't work because that will discard the fractional part of the number and round the number down (i.e., toward zero). However, in the `<math.h>` library, there is a function called `round()` that we can use alongside a cast to get the correct result.

*Note*: if you ever use the `<math.h>` library, you need to compile your source file with the `-lm` flag (e.g., `gcc change.c -lm`).

``` c
#include <stdio.h>
#include <math.h> // Contains the round() function.

int main(void)
{
    double change = 0.00;
    int dollars = 0, quarters = 0, dimes = 0, nickels = 0, pennies = 0;

    printf("Enter the amount of change: ");
    scanf("%lf", &change);

    printf("change initially = %0.20lf\n", change);
    change = (int)(round((change * 100)));
    printf("change multiplied by 100 and rounded = %0.20lf\n", change);

    while (change != 0)
    {
        if (change >= 100)
        {
            dollars++;
            change = change - 100;
        }
        else if (change >= 25)
        {
            quarters++;
            change = change - 25;
        }
        else if (change >= 10)
        {
            dimes++;
            change = change - 10;
        }
        else if (change >= 5)
        {
            nickels++;
            change = change - 5;
        }
        else if (change >= 1)
        {
            printf("pennies = %d\n", pennies);
            printf("change = %0.2lf\n", change);
            pennies++;
            change = change - 1;
        }
        printf("change = %0.20lf\n", change);
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
change initially = 4.38999999999999968026
change rounded = 439.00000000000000000000
change = 339.00000000000000000000
change = 239.00000000000000000000
change = 139.00000000000000000000
change = 39.00000000000000000000
change = 14.00000000000000000000
change = 4.00000000000000000000
pennies = 0
change = 4.00
change = 3.00000000000000000000
pennies = 1
change = 3.00
change = 2.00000000000000000000
pennies = 2
change = 2.00
change = 1.00000000000000000000
pennies = 3
change = 1.00
change = 0.00000000000000000000
4 Dollars
1 Quarters
1 Dimes
0 Nickels
4 Pennies
```

Dealing with floating-point numbers can be tricky, especially when using them in comparison statements and arithmetic operations. As seen above, printing more decimal places than you think you need will show you how a number is *actually* being represented and can be used to guide any further steps you take.
