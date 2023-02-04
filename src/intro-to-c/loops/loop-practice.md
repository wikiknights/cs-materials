---
title: Loop Practice
author:
  - Jerrett Longworth
  - Idel Martinez
toc: false
---

@. Create a program that prints all even numbers from 1 to 50 inclusive. (You must use a loop.)

@. Create a program that prints all numbers between 1 and 100 inclusive, except for numbers evenly divisible by 5.

@. How many times will the following loop run? (Hint: Don't try to run it)

  ``` c
  void the_coolest_loop(void)
  {
    int i;

    for (i = 0; i < 10; i--)
    {
      printf("i is %d!\n", i);
    }
  }
  ```

@. What will the print statements in lines 9 and 17 output? Will it be the same? (You may use a calculator if you want to be exact.) Assume that uninitialized variables in C get assigned garbage values.

  ``` {.c .numberLines}
  void print_sums(void)
  {
    int sum;

    for (int j = 0; j != 10; j++)
    {
      sum = sum + j;
    }
    printf("Sum is %d\n", sum);
    printf("Resetting...\n");

    sum = 0;
    for (int j = 0; j != 10; j++)
    {
      sum = sum + j;
    }
    printf("Sum is now %d\n", sum);
  }
  ```

@. Rewrite the following code to make an equivalent program that uses a for loop, rather than this while loop.

  ``` c
  int number = 5;
  while (number < 500)
  {
    printf("number = %d\n", number);
    number++;
  }
  ```

@. Rewrite the following code to make an equivalent program that uses a while loop, rather than this for loop.

  ``` c
  int items;
  int item_cost = 5;
  int remaining_dollars = 50;

  printf("You have $%d. Let's see how many items you can buy!\n", remaining_dollars);

  for (items = 0; remaining_dollars >= item_cost; items++)
  {
    remaining_dollars -= item_cost;
  }

  printf("You bought a total of %d items with your money!\n", items);
  ```

@. Is there a difference between the output of these two loops? If so, what is it?

  ``` c
  int x;

  // Loop 1
  x = 0;
  while (x < 10)
  {
    printf("%d\n", x);
    x++;
  }

  // Loop 2
  x = 0;
  do
  {
    printf("%d\n", x);
    x++;
  } while (x < 10);
  ```

@. Fill in the blanks to end the loop if `sum > 200`.

  ``` c
  int sum = 0;

  for (int i = 0; i < n; i++)
  {
    if (_____)
    {
      _____;
    }

    sum += i;
  }
  ```

@. What would be printed if the following program runs?

  ``` c
  #include <stdio.h>

  int main(void)
  {
    printf("We are starting the loop!\n");

    for (int i = 0; i < 5; i++)
    {
      if (i == 3)
      {
        return 0;
      }

      printf("i = %d\n", i);
    }

    printf("We are ending the loop!\n");

    return 0;
  }
  ```

@. What would be the **return value** of `loopy_loop()` if executed?

  ``` c
  int loopy_loop(void)
  {
    int x = 0;

    while (x < 10)
    {
      printf("x = %d\n", x);

      if (x == 5)
      {
        return 2;
      }

      x += 2;
    }

    return 5;
  }
  ```

@. Write a program that finds the sum of all integers that a user types in, then when the user types 0, the final sum will be displayed and the program ends. The following is an example of running the program:

  ```
  5
  10
  4
  -9
  0
  The sum is: 10
  ```

@. Write a program that prints an `n` by `n` "addition table." An addition table is like a multiplication table, except the row and column numbers are added instead of being multiplied. For example, the following is a 5x5 addition table.

  ```
  0   1   2   3   4
  1   2   3   4   5
  2   3   4   5   6
  3   4   5   6   7
  4   5   6   7   8
  ```

@. **Challenge:** Write a program that prints a diamond shape with a height of `n`. Assume that `n` is greater than 2 and is odd. As an example, the following is a diamond with a height of 5.

  ```
    #
   # #
  #   #
   # #
    #
  ```