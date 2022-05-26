# Loop Practice (Solutions)

*Originally created by Jerrett Longworth and Idel Martinez in Spring 2021.*

1. How many times will the following loop run? (Hint: Don't try to run it)

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

  **Answer**: This is an infinite loop! `i` never goes past 10 (since we're always decreasing) so the array goes on forever.

\newpage

2. What will the print statements in lines 9 and 17 output? Will it be the same? (You may use a calculator if you want to be exact.) Assume that uninitialized variables in C get assigned garbage values.

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

  **Answer**: Both loops are doing the same thing, but `sum` is not initialized (only declared) in line 3, so it has *bleh* inside of it. Because of this only the second print is going to be correct saying that "Sum is now 55".