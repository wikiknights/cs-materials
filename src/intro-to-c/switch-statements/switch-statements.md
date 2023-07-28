---
title: Switch Statements
author:
  - Ian Thomas
  - Mattehw Gibbons
---

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

`switch(a)`

This establishes the switch statement. It takes in a variable a to be compared.

`case CONSTANT:`

This compares the variable a that was previously taken in to a constant. Functionally, this is the same as `if (a == CONSTANT)`

`break;`

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

## Switch Statement Versatility

Much like if statements, you can nest switch statements inside switch cases. You can also do arithmetic and conditional statements (because true and false are represented by 1 and 0 in C) in the switch condition. We'll take a look at each of these uses of switch statements, plus one more weird thing you can do with switches (but shouldn't).

### Nested Switch Statements

Take a look at this small switch statement:

```C
#include <stdio.h>

int main(void)
{
    int option = 1;
    int sub_option = 20;

    switch(option)
    {
    case 1:
        printf("Entered case 1...\n\n");
        switch(sub_option){
        case 10:
            printf("Case 1 of the nested switch :(");
            break;
        case 20:
            printf("Inside case 2 of the nested switch!\n");
            break;
        }
        break;
    case 2:
        printf("Case 2 of the first switch statement :(\n");
        break;

    }
        return 0;
}
```

The output will be as follows:

```
Entered case 1...

Inside case 2 of the nested switch!
```

You will notice that the print statement in case 1 is executed before the nested switch statement, which then executes case 20. After case 20 is executed and broken out of, the nested switch has ended and the break statement from case 1 is hit, terminating the outer switch statement and thus the program. A default is excluded from this example, but best practice is to add a default case as the last case of a switch statement.

*Note:* These cases were named this way to make it easy to talk about, but you can have cases with the same names if the duplicate names are in different switch statements, including nested switch statements.

### Arithmetic and Conditional Statements in Switch Conditions

#### Conditions in Switch Cases

### Weird Switch Cases

First step: don't do this. You can use switch statements around other control structures, the most common being curly brackets.

## Switch Statement Errors

