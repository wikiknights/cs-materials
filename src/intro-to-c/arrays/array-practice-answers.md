---
title: Array Practice (Solutions)
author:
  - Jerrett Longworth
  - Idel Martinez
toc: false
---

@. Fill in the blanks for the program to create an array of odd numbers from 1 to `max`, which will be inputted by the user.

  **Answer**:

  ``` c
  int main(void)
  {
    int max;
    printf("Enter the maximum number to go to: ");
    scanf("%d", &max);

    int size = (max + 1) / 2;
    int odd = 1;
    int odd_numbers[size];

    for (int i = 0; i < size; i++)
    {
      odd_numbers[i] = odd;
      odd = odd + 2;
    }

    for (int i = 0; i < size; i++)
    {
      printf("%d\n", odd_numbers[i]);
    }

    return 0;
  }
  ```

\newpage

@. Fill in the blanks for the program to initialize the `final` array with the squares of the numbers of the `initial` array. That is, if `initial` is array of with elements [1, 2, 3, 4, 5], our program will initialize the corresponding `final` array with the values squared as [1, 4, 9, 16, 25]. Make sure you accept arrays of any size!

  **Answer**:

  ``` c
  double square(double num)
  {
    return num * num;
  }

  void init_square_array(double *initial, double *final, int count)
  {
    for (int i = 0; i < count; i++)
    {
      final[i] = square(initial[i]);
    }
  }

  void print_array(double *array, int count)
  {
    printf("These are the values of the array!\n");
    for (int i = 0; i < count; i++)
    {
      printf("%lf\n", array[i]);
    }
  }

  int main(void)
  {
    double numbers[] = { 1, 2, 3, 4, 5 };
    double numbers_results[5];

    double evens[10];
    double evens_results[10];

    double x = 2;
    for (int i = 0; i < 10; i++)
    {
      evens[i] = x;
      x = x + 2;
    }

    init_square_array(numbers, numbers_results, 5);
    init_square_array(evens, evens_results, 10);

    print_array(numbers_results, 5);
    print_array(evens_results, 10);

    return 0;
  }
  ```

\newpage

@. Create a function that takes two integer arrays, `array1` and `array2`, and the length of `array1`, that copies the contents of `array1` into `array2`. Assume that `array2` has at least as many elements as `array1`.

  **Answer**:

  ``` c
  void copy_array(int *array1, int *array2, int length)
  {
    for (int i = 0; i < length; i++)
    {
      array2[i] = array1[i];
    }
  }
  ```

\newpage

@. What is wrong with the following code snippet? (Challenge yourself to avoid using your code editor.)

  ``` {.c .numberLines}
  #include <stdio.h>

  void print_float_array(float *array, int count)
  {
    for (int i = 0; i < count; i++)
    {
      printf(" %f", array[i]);
    }
    printf("\n");
  }

  int main(void)
  {
    float values[] = {3.14, 2.718, 6.9, 42.0};

    for (int i = 0; i < 4; i++)
    {
      print_float_array(values[i], 4);
    }

    return 0;
  }
  ```

  **Answer**: `print_float_array()` accepts a float array and a count, but line 18 is passing a float value, not an array. Also, since we iterate the for loop 4 times in `main()`, in which we call a function that goes throes *another* loop 4 times, we would be doing twice the amount of work. To fix it, we would simplify the code in `main()` to:

  ``` c
  int main(void)
  {
    float values[] = {3.14, 2.718, 6.9, 42.0};

    print_float_array(values, 4);

    return 0;
  }
  ```

\newpage

@. Create a function that adds 5 to every odd element of an array of integers. Assume you are provided an integer array (called `array`) and an integer representing the number of elements in the array (called `length`).

    **Answer:** First, we must figure out what the function declaration will look like. If we are given an integer array and the number of elements, the parameters may look like `(int *array, int length)` or `(int array[], int length)`.

    Next, we must figure out the return type of the function. Since we are modifying the array in-place, this function does not need to return anything. This makes the return type `void`.

    Finally, we will call the function `add_five_to_odd`. With this, we can get the function declaration:

    ``` c
    void add_five_to_odd(int *array, int length)
    {
      // Your code here
    }
    ```

    This function should traverse through the array, and if it finds an odd element (using the modulus operation), five should be added to this element. In total, this function may look like the following:

    ``` c
    void add_five_to_odd(int *array, int length)
    {
      for (int i = 0; i < length; i++)
      {
        if (array[i] % 2 == 1)
        {
          array[i] += 5;
        }
      }
    }
    ```
