# Conditional Statement Practice (Answers)

*Created by Jerrett Longworth in February 2022.*

How can you check if something is true or not, and can you get your code to act differently depending on those conditions? Yes, you can! Let's get some practice using conditional statements.

---

1. Given the following program, what will be the output?

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



2. Given the following program, what will be the output?

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


3. From the program in the previous problem, how would the output change if the "`else if`" changed to "`if`" (or would it change at all)?

**Answer:**
```
This is statement #1!
This is statement #2!
```

x (13) is less than z (15), so the first statement is printed. After this, the condition in the second if statement is then checked for its trueness. x (13) is greater than y (6), so this condition is true.

Since the second condition is now using an if statement rather than an else-if statement, it would no longer be connected to the first if statement. In other words, the second if statement is treated separately and will check its condition regardless of the outcome of the first if statement.

\newpage


4. Given the following program, what will be the output?

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


5. Given the following program, what will be the output?

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


6. Given the following program, what will be the output?

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

The first condition (`x == y || z < x`) is checked first. Within this, the first out of the two parts is checked (`x == y`). x (213) is not equal to y (912), so this statement is false. The the second part after the `||` is now checked (`z < x`). z (1021) is not less than x (213), so this statement is also false, and consequently `FALSE || FALSE` can be considered a false statement. The program moves to check the second if statement.

Out of the entire condition, `(x - 213 == 1 || y != 213)` is checked first, since it is within parentheses. Within this condition, `x - 213 == 1` is checked first. x (213) - 213 is 0, which is not equal to 1, so this statement is false. `y != 213` is checked next. y (912) is not equal to 213, so this statement is true. `FALSE || TRUE` is true, so this entire condition in parentheses is true. Now `y <= z` is checked.

y (912) is less than or equal to z (1021), so this statement is true. `TRUE && TRUE` is a true statement, so this entire second if statement is true. Statement #2 is printed. The else statement is skipped and the program finishes.

\newpage

---

## Challenge problems

In some curricula, conditions are covered before functions, so these following questions are considered "challenge problems." If you have already studied functions, these additional problems are excellent exercises to get more familiar with both conditionals and functions.

7. Given the following program, what will be the output?

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


8. Given the following program, what will be the output?

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


9. Given the following program, what will be the output?

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