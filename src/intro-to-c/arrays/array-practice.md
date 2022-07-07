---
title: Array Practice
author:
  - Jerrett Longworth
  - Idel Martinez
---

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
