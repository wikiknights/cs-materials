---
title: Variable Practice (Answers)
author: Jerrett Longworth
toc: false
---

Here are some exercises that will help you get a better grasp of using variables! (Try solving these by hand without a compiler!)

---

@. Write one line of code that declares an integer called `cups_of_tea` and assigns to it a value of 5.

**Answer:**
``` c
int cups_of_tea = 5;
```

\newpage

@. What is wrong with the following code? How can you fix it?

``` c
#include <stdio.h>

int main(void)
{
  printf("The value of x is %d.\n", x);

  int x = 7;

  return 0;
}
```

**Answer:** `x` is declared *after* the `printf()` statement! This means that `x` does not yet exist at the time of the `printf()`. Even if it did somehow exist, it would not have a defined value.

To fix the issue, simply swap the lines with the `printf()` statement and the assignment to `x`. A revised version of the code might look like the following:

``` c
#include <stdio.h>

int main(void)
{
  int x = 7;

  printf("The value of x is %d.\n", x);

  return 0;
}
```

\newpage

@. Which of the following are not valid variable names? If any are invalid, explain why.

**Answer:**

- `__basic`
  * Valid.
- `apple#3`
  * Invalid - The `#` symbol is not allowed in a variable.
- `2023_year`
  * Invalid - A variable name cannot begin with a number.
- `INT`
  * Valid. (Since it is not the lowercase `int`, this is an allowed variable name.)
- `orANGE`
  * Valid.
- `total students`
  * Invalid - A variable name cannot contain a space.
- `982`
  * Invalid - A variable name cannot begin with a number.
- `float_`
  * Valid.

\newpage

@. Which of the following statements are not valid in C? If any are invalid, explain why.

**Answer:**

- `int float = 34123.4123 * 4;`{.c}
  * Invalid. `float` cannot be used as a variable name.
- `char student_name = 'John Smith';`{.c}
  * Invalid. The single quotation marks (`'`) can only contain one character.
- `int i = 0; i = i + 1;`{.c}
  * Valid.
- `4 = gpa;`{.c}
  * Invalid. The statement is in the wrong order. To assign the value 4 to `gpa`, the order should be flipped to `gpa = 4`.

\newpage

@. What is wrong with the following code? How can you fix it?

``` c
#include <stdio.h>

int main(void)
{
  ounces_of_milk = 16.0;
  printf("You have %lf ounces of milk.\n", ounces_of_milk);

  return 0;
}
```

**Answer:** `ounces_of_milk` is assigned a value without ever being declared first! You can't use a variable and assign it without first declaring it.

To fix this problem, you can place `double` (notice the `%lf` hints at which type to use) before `ounces_of_milk` to make one line that both declares and initializes the variable. A revised version of the code might look like the following:

``` c
#include <stdio.h>

int main(void)
{
  double ounces_of_milk = 16.0;
  printf("You have %lf ounces of milk.\n", ounces_of_milk);

  return 0;
}
```

Alternatively, you could add a new line of code before `ounces_of_milk = 16.0;` that declares it:

``` c
#include <stdio.h>

int main(void)
{
  double ounces_of_milk;
  ounces_of_milk = 16.0;
  printf("You have %lf ounces of milk.\n", ounces_of_milk);

  return 0;
}
```

*Author's note:* The second solution works, but is unnecessarily verbose, declaring and assigning `ounces_of_milk` on two consecutive lines. Should there have been other code between these lines, this decision may make more sense, but the first solution is preferrable.

\newpage

@. What is the final output of this program?

``` c
#include <stdio.h>

int main(void)
{
  int apples = 16;
  int oranges = 90;

  apples = oranges;
  oranges = apples;

  printf("You have %d apples and %d oranges.\n", apples, oranges);

  return 0;
}
```

**Answer:**
```
You have 90 apples and 90 oranges.
```
