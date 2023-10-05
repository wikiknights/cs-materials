---
title: Conditional Statement Practice
author: Jerrett Longworth
toc: false
---

How can you check if something is true or not, and can you get your code to act differently depending on those conditions? Yes, you can! Let's get some practice using conditional statements.

---

@. Whenever Bob is in class, the variable `class` is set to 1, and 0 otherwise. If Bob is doing homework, the variable `homework` is set to 1, and 0 otherwise. Create an expression using boolean operators and the provided variables that would evaluate to true if Bob is doing their homework in class.

@. Given the following program, what will be the output?

``` c
#include <stdio.h>

int main(void)
{
  int x = 5;
  int y = 17;

  if (x > y)
  {
    printf("This is statement #1!\n");
  }
  else
  {
    printf("This is statement #2!\n");
  }

  return 0;
}
```


@. Given the following program, what will be the output?

``` c
#include <stdio.h>

int main(void)
{
  int x = 13;
  int y = 6;
  int z = 15;

  if (x < z)
  {
    printf("This is statement #1!\n");
  }
  else if (x > y)
  {
    printf("This is statement #2!\n");
  }
  else
  {
    printf("This is statement #3!\n");
  }

  return 0;
}
```


@. From the program in the previous problem, how would the output change if the "`else if`" changed to "`if`" (or would it change at all)?


@. Given the following program, what will be the output?

``` c
#include <stdio.h>

int main(void)
{
  int x = 5;
  int y = 17;

  if (!(x > y))
  {
    printf("This is statement #1!\n");
  }
  else
  {
    printf("This is statement #2!\n");
  }

  return 0;
}
```


@. Given the following program, what will be the output?

``` c
#include <stdio.h>

int main(void)
{
  int x = 19;
  int y = 100;
  int z = 2;

  if (y > z || y < x)
  {
    printf("This is statement #1!\n");
  }
  else
  {
    printf("This is statement #2!\n");
  }

  return 0;
}
```

@. *The infamous Bizz-Fuzz Problem.* Create a program that does the following:

    - Accept an integer input from the user. Assume that the input is positive. You do not need to accommodate for invalid inputs.
    - If the number is evenly divisible by 5, print "`Bizz!`"
    - If the number is evenly divisible by 7, print "`Fuzz!`"
    - If the number is evenly divisible by BOTH 5 and 7, print "`Bizz-Fuzz!`"
    - If the number is not evenly divisible by 5 or 7, print nothing.

    **Examples:**

    - *Example 1:*
      - Input: `15`
      - Output: `Bizz!`
    - *Example 2:*
      - Input: `24`
      - Output:
    - *Example 3:*
      - Input: `70`
      - Output: `Bizz-Fuzz!`
    - *Example 4:*
      - Input: `14`
      - Output: `Fuzz!`


@. Given the following program, what will be the output?

``` c
#include <stdio.h>

int main(void)
{
  int x = 213;
  int y = 912;
  int z = 1021;

  if (x == y || z < x)
  {
    printf("This is statement #1!\n");
  }
  else if (y <= z && (x - 213 == 1 || y != 213))
  {
    printf("This is statement #2!\n");
  }
  else
  {
    printf("This is statement #3!\n");
  }

  return 0;
}
```

@. You want to buy fruits from Super Saver Superstore. At Super Saver, there are incredible (but very convoluted) discounts for the more you buy. You just want to buy apples and bananas, so only the discounts for those will be listed. The costs are as follows:

    - Apples normally cost $1.50 per pound.
    - Bananas normally cost $0.75 per pound.
    - If at least 10 pounds of bananas are purchased, the cost of apples is discounted 40% off their original rate.
    - If at least 14 pounds of apples are purchased, the cost of bananas is discounted 60% off their original rate.
    - While the savings are outrageous, there is also a limit to the magic. After discounts, if your total order cost is greater than $100, your order will be rejected. In this case, print "`Sorry, you are limited to $100 of items.`"
    - To make the discounts economically feasible, there is also a minimum order cost (after discounts) of $5. If the order is less than this amount, print "`Sorry, you must spend a minimum of $5.`"
    - Do not calculate any additional taxes or fees.

    Write a program that takes an input for the weights of apples and bananas in pounds, and outputs their total cost after discounts, unless the minimum or maximum has been reached. Assume that the inputs are valid, positive numbers.

    **Examples:**

    - *Example 1:*

        ```
        Enter weight of apples in pounds: 6
        Enter weight of bananas in pounds: 2.4
        The total cost is $10.80.
        ```
    - *Example 2:*

        ```
        Enter weight of apples in pounds: 0
        Enter weight of bananas in pounds: 1
        Sorry, you must spend a minimum of $5.
        ```
    - *Example 3:*

        ```
        Enter weight of apples in pounds: 18
        Enter weight of bananas in pounds: 26
        The total cost is $24.00.
        ```
    - *Example 4:*

        ```
        Enter weight of apples in pounds: 80.8
        Enter weight of bananas in pounds: 10
        The total cost is $75.72.
        ```
    - *Example 5:*

        ```
        Enter weight of apples in pounds: 80.8
        Enter weight of bananas in pounds: 9.5
        Sorry, you are limited to $100 of items.
        ```

---

## Challenge problems

In some curricula, conditions are covered before functions, so these following questions are considered "challenge problems." If you have already studied functions, these additional problems are excellent exercises to get more familiar with both conditionals and functions.


@. Given the following program, what will be the output?

``` c
#include <stdio.h>

int fun_function(int y)
{
  if (y > 10)
  {
    return 5123;
  }
  else
  {
    return 64;
  }
}

int main(void)
{
  int x = 8511;
  int y = 754;
  int z = 27;

  if (x > z && fun_function(z) >= 65)
  {
    printf("This is statement #1!\n");
  }
  else
  {
    printf("This is statement #2!\n");
  }

  return 0;
}
```


@. Given the following program, what will be the output?

``` c
#include <stdio.h>

int funny_function(int x)
{
  x = x / 2;

  if (x > 50)
  {
    printf("This is statement #1!\n");
  }
  else
  {
    printf("This is statement #2!\n");
  }

  return x;
}

int main(void)
{
  int x = 4;
  int y = 111;
  int z = 1520;

  if (z > y || funny_function(z) > 65)
  {
    printf("This is statement #3!\n");
  }
  else
  {
    printf("This is statement #4!\n");
  }

  return 0;
}
```


@. Given the following program, what will be the output?

``` c
#include <stdio.h>

int funny_function(int z)
{
  z = z / 2;

  if (z > 50)
  {
    printf("This is statement #1!\n");
  }
  else
  {
    printf("This is statement #2!\n");
  }

  return z;
}

int main(void)
{
  int x = 6854;
  int y = 111;
  int z = 1520;

  if (z > y && funny_function(z) < 65)
  {
    printf("This is statement #3!\n");
  }
  else
  {
    printf("This is statement #4!\n");
  }

  return 0;
}
```