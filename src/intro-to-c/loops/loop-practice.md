# Loop Practice

*Originally created by Jerrett Longworth and Idel Martinez in Spring 2021. Appended by Jerrett Longworth in Summer 2022.*

1. Create a program that prints all even numbers from 1 to 50 inclusive. (You must use a loop.)

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

4. Rewrite the following code to make an equivalent program that uses a for loop, rather than this while loop.

  ``` c
  int number = 5;
  while (number < 500)
  {
    printf("number = %d\n", number);
    number++;
  }
  ```

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

6. Write a program that prints an `n` by `n` "addition table." An addition table is like a multiplication table, except the row and column numbers are added instead of being multiplied. For example, the following is a 5x5 addition table.

  ```
  0   1   2   3   4
  1   2   3   4   5
  2   3   4   5   6
  3   4   5   6   7
  4   5   6   7   8
  ```

7. **Challenge:** Write a program that prints a diamond shape with a height of `n`. Assume that `n` is greater than 2 and is odd. As an example, the following is a diamond with a height of 5.
  
  ```
    #
   # #
  #   #
   # #
    #
  ```