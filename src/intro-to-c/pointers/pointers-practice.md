# Pointers Practice

*Created by Jerrett Longworth in June 2022.*

Let's try some example problems using pointers!

---

## Basic Pointer Operations

@. What will this program print if executed?

  ``` c
  #include <stdio.h>

  int main(void)
  {
    int x = 7;
    int *pointer = &x;

    x = 10;
    *pointer = 75;
    printf("x = %d\n", x);

    return 0;
  }
  ```

@. What will this program print if executed?
  
  ``` c
  #include <stdio.h>

  int main(void)
  {
    int n = 43;

    printf("%d\n", *&*&*&*&*&*&n);

    return 0;
  }
  ```

---

## Function Scope

@. What will this program print if executed?

  ``` c
  #include <stdio.h>

  // This function adds 1 to an integer.
  void change_number(int n)
  {
    n++;
  }

  int main(void)
  {
    int x = 6, y = 9;

    printf("Before:\n");
    printf("x is %d\n", x);
    printf("y is %d\n", y);

    change_number(x);
    change_number(y);

    printf("After:\n");
    printf("x is %d\n", x);
    printf("y is %d\n", y);

    return 0;
  }
  ```

@. What will this program print if executed? What is the difference between this and the previous problem?

  ``` c
  #include <stdio.h>

  // This function adds 1 to an integer.
  void change_number(int *n)
  {
    *n++;
  }

  int main(void)
  {
    int x = 6, y = 9;

    printf("Before:\n");
    printf("x is %d\n", x);
    printf("y is %d\n", y);

    change_number(&x);
    change_number(&y);

    printf("After:\n");
    printf("x is %d\n", x);
    printf("y is %d\n", y);

    return 0;
  }
  ```

@. What will this program print if executed? What is the difference between this and the previous two problems?

  ``` c
  #include <stdio.h>

  // This function adds 1 to an integer.
  void change_number(int *n)
  {
    (*n)++;
  }

  int main(void)
  {
    int x = 6, y = 9;

    printf("Before:\n");
    printf("x is %d\n", x);
    printf("y is %d\n", y);

    change_number(&x);
    change_number(&y);

    printf("After:\n");
    printf("x is %d\n", x);
    printf("y is %d\n", y);

    return 0;
  }
  ```

---

## More Advanced Function Scope

@. Fill in this `swap()` function to swap the values referenced by two pointers.

  ``` c
  #include <stdio.h>

  void swap(int *a, int *b)
  {
    // Your code here
  }

  int main(void)
  {
    int num, ber;

    num = 68;
    ber = 70;

    printf("%d %d\n", num, ber);
    swap(&num, &ber);
    printf("%d %d\n", num, ber);

    return 0;
  }
  ```

@. What will this program print if executed?

  ``` c
  #include <stdio.h>

  int functiomatic(int *n)
  {
    *n = *n + 1;
    return *n + 1;
  }

  int main(void)
  {
    int b;
    int *c;

    b = 17;
    b = functiomatic(&b);
    c = &b;

    printf("*c = %d\n", *c);

    return 0;
  }
  ```

@. What will this program print if executed?

  ``` c
  #include <stdio.h>

  int functiomatic(int n)
  {
    int m = n + 1;
    return n;
  }

  int main(void)
  {
    int b;
    int *c;

    b = 17;
    b = functiomatic(b);
    c = &b;

    printf("*c = %d\n", *c);

    return 0;
  }
  ```

---

## Pointers and Arrays

@. What does `array` contain after line 13? What will this program print if executed? Assume that any uninitialized variables contain garbage values.

  ``` {.c .numberLines}
  #include <stdio.h>

  #define LENGTH 10

  int main(void)
  {
    int array[LENGTH];

    // Initialize array
    for (int i = 0; i < LENGTH; i++)
    {
      array[i] = i * 10;
    }

    // What does this array now contain?

    // Print array
    for (int i = 0; i < LENGTH; i++)
    {
      printf("%d\n", *(array + i));
    }

    return 0;
  }
  ```

@. What will `array` contain after line 34? What will this program print if executed? Assume that any uninitialized variables contain garbage values.

  ``` {.c .numberLines}
  #include <stdio.h>

  #define LENGTH 10

  void initialize_array(int *arr, int length)
  {
    for (int i = 0; i < length; i++)
    {
      arr[i] = 50 + i;
    }
  }

  void print_array(int *arr, int length)
  {
    printf("[");

    for (int i = 0; i < length; i++)
    {
      printf("%d", arr[i]);

      if (i < length - 1)
      {
        printf(", ");
      }
    }

    printf("]\n");
  }

  int main(void)
  {
    int array[LENGTH];

    initialize_array(array, LENGTH - 2);

    // What does this array now contain?

    print_array(array, LENGTH);

    return 0;
  }
  ```