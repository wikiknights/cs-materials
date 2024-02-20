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

### Arithmetic and Conditionals in Switch Statements

Switch statements allow for plenty of versatility as a conditional statement. They can provide an outcome for every possible value of the condition. It may be a nightmare to actually do that, but that's what we had the default cases for.

#### Arithmetic in Switch Cases

Switch cases can be defined simply with integer values, as we've shown in previous examples. It is important to note that it is required of switch cases to resolve to a constant integer. Integers, arithmetic, integer comparison, and ASCII can all resolve to constant integers. This would be an example that does all of those things:

``` c
...
    switch(state){
    case 0 > 1:
        printf("This case resolves to 0 and is an integer comparison.\n");
        break;
    case 100 > 20:
        printf("This case resolves to 1 and is an integer comparison.\n");
        break;
    case 2:
        printf("This case resolves to 2 and is an integer.\n");
        break;
    case 2 + 1:
        printf("This case resolves to 3 and is arithmetic.\n");
        break;
    case ' ':
        printf("This case resolves to 32 and is ASCII.\n");
        break;
    }
...
```

**Things to note:** You cannot compare variables in switch cases, nor do any arithmetic with them. This is the constant integer issue from before.

In this switch statement, our `case 0` and `case 1` are defined integer comparison that resolve to 0 and 1, the `true` and `false` values in C. `Case 2` is an integer like we've seen before. `Case 3` is some integer arithmetic, but it can be defined with ASCII arithmetic, too, like `'A' + 35`. In our final case, we are using the value of the space character.

The first two cases are cumbersome ways to get to 0 and 1, but it's interesting nonetheless.

#### What can I use as a Switch Condition?

You can do more with the conditional portion of switch statements. Here are some examples of what we can do in the `state` of the switch statement:

```c
 switch((var1 * var2) % 15){
    ...
}
 switch(var3 > var4 || var5 == 'G'){
    ...
}
 switch(character[i]){
    ...
}
```

As you can see, you can do variable arithmetic, or a comparison, or even use a `char` (in this case I used a character array and used the ith element, which would also work) because they all resolve to an integer value that can be predicted as an outcome.

### Weird Switch Cases

Switch statements have some very strange behaviors that allow for interesting code. When a switch statement is used, it calculates and address and jumps to it. That means you can use switch statements around other control structures. For example, this would be valid code:

``` {.c .numberLines}
...
// Please don't do this.

    switch(state){
    case 0:
        if(x == 'a') {
            printf("In the if in case 0.\n");
        break;
    case 1:
        printf("In the if in case 1.\n");
        }
        printf("Out of the if, but in case 1.\n");
        break;
    case 2:
        printf("Case 2 is less interesting.\n");
        break;
    }
...
```

To process what would happen with this code, look at it without all the switch cases and breaks around it.

``` {.c .numberLines}
...
// Please don't do this.

//    switch(state){
//    case 0:
          if(x == 'a') {
              printf("In the if in case 0.\n");
//        break;
//    case 1:
          printf("In the if in case 1.\n");
          }
//        printf("Out of the if, but in case 1.\n");
//        break;
//    case 2:
//        printf("Case 2 is less interesting.\n");
//        break;
//    }
...
```

You will notice that you have a perfectly normal `if` statement. So what happens if we treat it like one? If `state` is set equal to 0 and `x` is set equal to `'a'`, then the output looks like this.

```
In the if in case 0.
```

That's very strange. It didn't execute the entire `if` statement. That is because of the `break` statement on line 8, but maybe not for the reason you'd think. Specifically, break statements break out of loops (`do`, `for`, and `while`) and switches. Note that `if` is not included in that list, and because the `if` is nested in a switch statement we escape before reaching line 10.

Let's take a look at the two other possibilities that create interesting results. Specifically, if 1) `x != 'a'` and `state = 0` and 2) `state = 1`. This would be the output for these cases:

@)
```
Out of the if, but in case 1.
```

In this instance, we enter `Case 0` and then the `if` statement, which resolves to false. Because of this, we jump to line 12, which is the middle of `Case 1`.

@)
```
In the if in case 1.
Out of the if, but in case 1
```

What we see here is the entrance into `Case 1`, which happens to be the middle of the `if` statement. This means we execute both print statements in the switch case, even though one of them is also inside an `if` statement.

If you want to implement this unique behavior, step one is simple: ***don't***. This has actual been used in code before, and is named Duff's device. It is a manual implementation of what we call "loop unrolling." I'm telling you that so you can look it up, _not so you can use it._

## Switch Statement Errors

