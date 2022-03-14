# Switch Statements

*Created by Ian Thomas in February 2022*

We have previously learned about `if-else` statements, but what if there was a more efficient way to handle multiple conditional arguments? 


Consider the following program:
## If-Else Example
``` c
#include <stdio.h>

int main(void)
{
    int a = 3;

    if (a == 1)
    {
        // Do something
    }
    else if (a == 2)
    {
        // Do something else
    }
    else if (a == 3)
    {
        // Do the thing
    }
    else
    {
        // Do this as a last resort
    }

    return 0;
}
```
This code works fine as it is, but as the number of conditions increase, cycling through each if statement can become both very tedious as well as computationally expensive. This is where `switch` statements come in.

Consider the following program:
## Switch Statement Example
```C
#include <stdio.h>

int main(void)
{
    int a = 3;

    switch(a)
    {
        case 1:
            // Do something
            break;
        case 2:
            // Do something else
            break;
        case 3:
            // Do the thing
            break;
        default:
            // Do this as a last resort
    }

    return 0;
}
```

Functionally, this executes the same functions as the previous example. Let's break down each component of the statement:

``` switch(a)```

This establishes the switch statement. It takes in a variable a to be compared. 

``` case CONSTANT: ```

This compares the variable a that was previously taken in to a constant. Functionally, this is the same as `if (a == CONSTANT)`

``` break; ```

This breaks the switch statement, ceasing any more comparisons and taking the user to the next line after the brackets. In the example above, it would take you to the line `return 0;`. This is not required, and can even be omitted to continue iterating through the switch statements. Here is an example:

```C
#include <stdio.h>

int main(void)
{
    int starRating = 4;

    switch (starRating)
    {
        case 5:
            printf("Your movie is perfect!\n");
            break;
        case 4:
        case 3:
            printf("Your movie is good!\n");
            break;
        case 2:
            printf("Your movie is okay.\n");
            break;
        case 1:
        case 0:
            printf("Your movie is bad.\n")
            break;
        default:
            printf("Invalid rating.\n");
            break;
    }

    return 0;
}
```

The output above prints 

`Your movie is good!`

Since the case for 4 is not broken, it executes the statement for the next case below. In this case it executes case 3's statement and then breaks. 

Overall, switch statements provide an efficient way of comparing a variable against multiple constants.