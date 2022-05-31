# Loop Practice (Solutions)

*Originally created by Jerrett Longworth and Idel Martinez in Spring 2021. Appended by Jerrett Longworth in Summer 2022.*

1. Create a program that prints all even numbers from 1 to 50 inclusive. (You must use a loop.)

  **Possible Answer:**

  ``` c
  #include <stdio.h>

  int main(void)
  {
    for (int i = 1; i <= 50; i++)
    {
      if (i % 2 == 0)
      {
        printf("%d\n", i);
      }
    }
    return 0;
  }
  ```

  **Another Possible Answer:**

  ``` c
  #include <stdio.h>

  int main(void)
  {
    for (int i = 2; i <= 50; i += 2)
    {
      printf("%d\n", i);
    }
    return 0;
  }
  ```

\newpage

2. How many times will the following loop run? (Hint: Don't try to run it)

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

3. What will the print statements in lines 9 and 17 output? Will it be the same? (You may use a calculator if you want to be exact.) Assume that uninitialized variables in C get assigned garbage values.

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

\newpage

4. Rewrite the following code to make an equivalent program that uses a for loop, rather than this while loop.

  ``` c
  int number = 5;
  while (number < 500)
  {
    printf("number = %d\n", number);
    number++;
  }
  ```

  **Answer:**

  ``` c
  for (int number = 5; number < 500; number++)
  {
    printf("number = %d\n", number);
  }
  ```

\newpage

5. Rewrite the following code to make an equivalent program that uses a while loop, rather than this for loop.

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

  **Answer:**

  ``` c
  int items = 0;
  int item_cost = 5;
  int remaining_dollars = 50;

  printf("You have $%d. Let's see how many items you can buy!\n", remaining_dollars);

  while (remaining_dollars >= item_cost)
  {
    remaining_dollars -= item_cost;
    items++;
  }

  printf("You bought a total of %d items with your money!\n", items);
  ```

\newpage

6. Is there a difference between the output of these two loops? If so, what is it?

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

**Answer:** This is a trick question! There is no difference in output between these two loops. Both of them will print the following:

```
0
1
2
3
4
5
6
7
8
9
```

(For another challenge, in what cases would a while loop differ from a do-while loop? Are they interchangeable, or is one sometimes more appropriate than the other?)

\newpage

7. Write a program that prints an `n` by `n` "addition table." An addition table is like a multiplication table, except the row and column numbers are added instead of being multiplied. For example, the following is a 5x5 addition table.

  ```
  0   1   2   3   4
  1   2   3   4   5
  2   3   4   5   6
  3   4   5   6   7
  4   5   6   7   8
  ```

  **Answer:**

  ``` c
  #include <stdio.h>

  int main(void)
  {
    // n can be set to any value, or even be collected through user input.
    int n = 5;

    // This uses two loops, the outer loop iterates row-by-row, and the
    // inner loop iterates across an individual row.
    for (int row = 0; row < n; row++)
    {
      for (int col = 0; col < n; col++)
      {
        // Here, we just print the sum of the current row and column number.
        // The 5 in %5d helps align all of the numbers.
        printf("%5d", row + col);
      }
      // At the end of each row, print a new line, visually starting the next row.
      printf("\n");
    }
    return 0;
  }
  ```

\newpage

8. **Challenge:** Write a program that prints a diamond shape with a height of `n`. Assume that `n` is greater than 2 and is odd. As an example, the following is a diamond with a height of 5.
  
  ```
    #
   # #
  #   #
   # #
    #
  ```

  **Sample Answer:**

  ``` c
  #include <stdio.h>

  int main(void)
  {
    // Break down into 3 sections per row: the space outside the diamond, the #'s
    // making up the diamond, and the space inside the diamond

    int n = 5;
    int outer_spaces, inner_spaces;

    for (int row = 0; row < n; row++)
    {
      // Calculate number of outer spaces
      if (row <= n / 2)
        outer_spaces = (n / 2) - row;
      else
        outer_spaces = row - (n / 2);

      // Print outer spaces
      for (int i = 0; i < outer_spaces; i++)
      {
        printf(" ");
      }

      // Print left side of diamond
      printf("#");

      // Calculate number of inner spaces
      if (row <= n / 2)
        inner_spaces = (2 * (row - 1)) + 1;
      else
        inner_spaces = (2 * (n - row - 2)) + 1;

      // Print inner spaces
      for (int i = 0; i < inner_spaces; i++)
      {
        printf(" ");
      }

      // Print right side of diamond (if not the top or bottom)
      if (row != 0 && row != n - 1)
      {
        printf("#");
      }

      // End the row
      printf("\n");
    }
    return 0;
  }
  ```