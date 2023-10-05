---
title: Conditional Statement Practice (Answers)
author: Jerrett Longworth
toc: false
---

How can you check if something is true or not, and can you get your code to act differently depending on those conditions? Yes, you can! Let's get some practice using conditional statements.

---

@. Whenever Bob is in class, the variable `class` is set to 1, and 0 otherwise. If Bob is doing homework, the variable `homework` is set to 1, and 0 otherwise. Create an expression using boolean operators and the provided variables that would evaluate to true if Bob is doing their homework in class.

**Answer:** `class && homework`

\newpage


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

**Answer:**
```
This is statement #2!
```

Since x (5) is not greater than y (17), the condition in the if statement is false. The program moves to the else statement.

\newpage


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

**Answer:**
```
This is statement #1!
```

x (13) is less than z (15), so the first statement is printed. Since the following else-if and else statements are chained with the first if statement, they are skipped over.

\newpage


@. From the program in the previous problem, how would the output change if the "`else if`" changed to "`if`" (or would it change at all)?

**Answer:**
```
This is statement #1!
This is statement #2!
```

x (13) is less than z (15), so the first statement is printed. After this, the condition in the second if statement is then checked for its trueness. x (13) is greater than y (6), so this condition is true.

Since the second condition is now using an if statement rather than an else-if statement, it would no longer be connected to the first if statement. In other words, the second if statement is treated separately and will check its condition regardless of the outcome of the first if statement.

\newpage


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

**Answer:**
```
This is statement #1!
```

Since x (5) is not greater than y (17), the condition in the if statement is false. False is then inverted to true, so the entire condition is true. The program moves to print statement #1.

\newpage


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

**Answer:**
```
This is statement #1!
```

First, `y > z` is checked. y (100) is greater than z (2), so this statement is true. Since this is a true statement on the left side of a Boolean OR (`||`), the program will not need to check the other side of the `||`. This is because `TRUE || <anything>` is considered a true statement.

The program then proceeds to print statement #1.

\newpage


@. *The infamous Bizz-Fuzz Problem.* Create a program that does the following:

    - Accept an integer input from the user. You do not need to accommodate for invalid inputs.
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

    **Answer:**

    ``` c
    #include <stdio.h>

    int main(void)
    {
      int input;

      scanf("%d", &input);

      if (input % 5 == 0 && input % 7 == 0)
      {
        printf("Bizz-Fuzz!\n");
      }
      else if (input % 5 == 0)
      {
        printf("Bizz!\n");
      }
      else if (input % 7 == 0)
      {
        printf("Fuzz!\n");
      }

      return 0;
    }
    ```

\newpage

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

**Answer:**
```
This is statement #2!
```

The first condition (`x == y || z < x`) is checked first. Within this, the first out of the two parts is checked (`x == y`). x (213) is not equal to y (912), so this statement is false. Then the second part after the `||` is now checked (`z < x`). z (1021) is not less than x (213), so this statement is also false, and consequently `FALSE || FALSE` can be considered a false statement. The program moves to check the second if statement.

Out of the entire condition, `(x - 213 == 1 || y != 213)` is checked first, since it is within parentheses. Within this condition, `x - 213 == 1` is checked first. x (213) - 213 is 0, which is not equal to 1, so this statement is false. `y != 213` is checked next. y (912) is not equal to 213, so this statement is true. `FALSE || TRUE` is true, so this entire condition in parentheses is true. Now `y <= z` is checked.

y (912) is less than or equal to z (1021), so this statement is true. `TRUE && TRUE` is a true statement, so this entire second if statement is true. Statement #2 is printed. The else statement is skipped and the program finishes.

\newpage


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

    **Sample Answer:**

    ``` c
    #include <stdio.h>

    int main(void)
    {
        double apple_lb, banana_lb;
        double apple_cost, banana_cost, total_cost;

        printf("Enter weight of apples in pounds: ");
        scanf("%lf", &apple_lb);
        printf("Enter weight of bananas in pounds: ");
        scanf("%lf", &banana_lb);

        // Apples cost $1.50 per pound.
        // Bananas cost $0.75 per pound.
        apple_cost = apple_lb * 1.50;
        banana_cost = banana_lb * 0.75;

        if (banana_lb >= 10)
        {
            // 40% off the cost of apples.
            apple_cost = apple_cost * 0.6;
        }

        if (apple_lb >= 14)
        {
            // 60% off the cost of bananas.
            banana_cost = banana_cost * 0.4;
        }

        total_cost = apple_cost + banana_cost;

        if (total_cost > 100)
        {
            printf("Sorry, you are limited to $100 of items.\n");
        }
        else if (total_cost < 5)
        {
            printf("Sorry, you must spend a minimum of $5.\n");
        }
        else
        {
            printf("The total cost is $%0.2lf.\n", total_cost);
        }

        return 0;
    }
    ```

---

\newpage


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

**Answer:**
```
This is statement #1!
```

First, the condition `x > z` is checked first. x (8511) is greater than z (27), so this statement is true. Now the other side of the Boolean AND (`&&`) is checked. In order to do this, C will first need to call `fun_function(z)` and find its return value, so it can be then be compared against 65.

Inside of the scope of `fun_function()`, y is given the value 27 (from z in `main()`). y (27) is greater than 10, so the function returns 5123.

Returning to `main()`, `fun_function(z)` (5123) is greater than or equal to 65, so this statement is true. Both sides of the AND are true, so the entire statement is true. Statement #1 is printed.

\newpage


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

**Answer:**
```
This is statement #3!
```

First, the condition `z > y` is checked first. z (1520) is greater than y (111), so this statement is true. Since `TRUE || <anything>` is considered true, the other side of the `||` is not checked. Statement #3 is immediately printed.

\newpage


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

**Answer:**
```
This is statement #1!
This is statement #4!
```

First, the condition `z > y` is checked first. z (1520) is greater than y (111), so this statement is true. Since the truthiness of `TRUE && <anything>` depends on the other side of the `&&`, the right side of the `&&` is then checked.

In determining if `funny_function(z) < 65` is true, the return value of `funny_function(z)` is required, so it is then called.

Inside the scope of `funny_function()`, z is equal to 1520. z is then assigned to z / 2, which is 1520 / 2 = 760. `z > 50` is then checked, where z (760) is greater than 50, so this statement is true. Statement #1 is printed. The else statement is skipped and `funny_function()` then returns z (760).

Now `funny_function(z) < 65` can be checked. `funny_function(z)` (760) is not less than 65, so this statement is false. `TRUE && FALSE` is false, so the entire condition is false. The program moves to the else statement and prints statement #4.