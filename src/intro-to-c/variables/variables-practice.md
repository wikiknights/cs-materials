---
title: Variable Practice
author: Jerrett Longworth
toc: false
---

Here are some exercises that will help you get a better grasp of using variables! (Try solving these by hand without a compiler!)

---

@. Write one line of code that declares an integer called `cups_of_tea` and assigns to it a value of 5.

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

@. Which of the following are not valid variable names? If any are invalid, explain why.

- `__basic`
- `apple#3`
- `2023_year`
- `INT`
- `orANGE`
- `total students`
- `982`
- `float_`

@. Which of the following statements are not valid in C? If any are invalid, explain why.

- `int float = 34123.4123 * 4;`{.c}
- `char student_name = 'John Smith';`{.c}
- `int i = 0; i = i + 1;`{.c}
- `4 = gpa;`{.c}

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
