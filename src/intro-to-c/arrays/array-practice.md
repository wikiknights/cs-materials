---
title: Array Practice
author:
  - Jerrett Longworth
  - Idel Martinez
toc: false
---

@. Write a line of code that declares an array called `uv_levels` that contains 5 integers.

@. Which element of the array does the following expression refer to?

  ``` c
  numbers[3]
  ```

@. What is the difference between the `4` in each of the following statements?

  ``` c
  int numbers[4];
  
  numbers[4] = 25;
  ```

@. Fill in the blanks to initialize an array with 10 `double`s, starting at 0 and incrementing by 0.5 for each value. In other words, the final array should contain `[0.0, 0.5, 1.0, 1.5, 2.0, ..., 4.5]`.

  ``` c
  #include <stdio.h>

  void initialize(_____array, _____length)
  {
    for (int i = 0; i < length; i++)
    {
      array[_____] = _____;
    }
  }

  int main(void)
  {
    // Create the array
    _____ array[_____];

    // Initialize array values
    initialize(_____, _____);

    // View the values in the array
    for (int i = 0; i < 10; i++)
    {
      printf("array[%d] = %0.1lf\n", i, array[i]);
    }

    return 0;
  }
  ```

@. What will be the output of the following program? If there is an error in the code, explain what the error is instead.

  ``` c
  #include <stdio.h>

  void increase_by_one(int array[], int length)
  {
    for (int i = 0; i < length; i++)
    {
      array[i]++;
    }
  }

  int main(void)
  {
    int array[5] = {1, 2, 3, 4, 5};

    increase_by_one(array, 5);

    for (int i = 0; i < 5; i++)
    {
      printf("%d\n", array[i]);
    }

    return 0;
  }
  ```

@. Fill in the blanks for the program to create an array of odd numbers from 1 to `max`, which will be inputted by the user.

  ``` c
  int main(void)
  {
    int max;
    printf("Enter the maximum number to go to: ");
    scanf(_____, _____);

    int size = (max + 1) / 2;
    int odd = 1;
    int odd_numbers[size];

    for (int i = 0; i < _____; i++)
    {
      odd_numbers[_____] = odd;
      odd = odd + _____;
    }

    for (int i = 0; _____; _____)
    {
      printf("%d\n", odd_numbers[_____]);
    }

    return 0;
  }
  ```

@. Fill in the blanks for the program to initialize the `final` array with the squares of the numbers of the `initial` array. That is, if `initial` is array of with elements [1, 2, 3, 4, 5], our program will initialize the corresponding `final` array with the values squared as [1, 4, 9, 16, 25]. Make sure you accept arrays of any size!

  ``` c
  double square(double num)
  {
    return num * num;
  }

  void init_square_array(double *initial, double *final, int count)
  {
    for (int i = 0; i < _____; _____)
    {
      final[_____] = square(_____);
    }
  }

  void print_array(double *array, int count)
  {
    printf("These are the values of the array!\n");
    for (int i = _____; i < _____; i++)
    {
      printf(_____, array[_____]);
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

@. Create a function that takes two integer arrays, `array1` and `array2`, and the length of `array1`, that copies the contents of `array1` into `array2`. Assume that `array2` has at least as many elements as `array1`.

  **Hint:** The function signature will look something like this:

  ``` c
  void copy_array(int *array1, int *array2, int length);
  ```

@. What is wrong with the following code snippet? (Challenge yourself to avoid using your code editor.)

  ``` c
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

@. Create a function that adds 5 to every odd element of an array of integers. Assume you are provided an integer array (called `array`) and an integer representing the number of elements in the array (called `length`).