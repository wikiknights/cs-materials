# Pointers Practice (Solutions)

*Created by Jerrett Longworth in June 2022.*

Let's try some example problems using pointers!

---

## Basic Pointer Operations

1. What will this program print if executed?

  ``` {.c .numberLines}
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

  **Answer:** `x = 75`

  The integer `x` begins by being set to the value 7 on line 5. On line 6, The integer pointer called `pointer` is set to the location of x. This means that any changes to `x` will be reflected in a change to the value of `*pointer`.

  On line 8, `x` is set to the value 10. (Again, this means that `*pointer` is also 10 at this time.) On line 9, `*pointer` is set to the value 75. In the other direction, the value of `x` is changed to 75 directly using the dereference operation.

  The program thus prints `x = 75` at the end.

\newpage

2. What will this program print if executed?
  
  ``` c
  #include <stdio.h>

  int main(void)
  {
    int n = 43;

    printf("%d\n", *&*&*&*&*&*&n);

    return 0;
  }
  ```

  **Answer:** `43`

  This is a trick question! The reference and dereference operators cancel each other out, so with the same number of each operator, you are simply left with `n` to print.

---

\newpage

## Function Scope

3. What will this program print if executed?

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

  **Answer:**

  ```
  Before:
  x is 6
  y is 9
  After:
  x is 6
  y is 9
  ```

  Notice that the `change_number()` function is using a pass-by-value method, meaning any changes that occur in it cannot be reflected back in `main()`, unless a return value was used. This is not the case, so both `x` and `y` remain with their initial values.

\newpage

4. What will this program print if executed? What is the difference between this and the previous problem?

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

  **Answer:**

  ```
  Before:
  x is 6
  y is 9
  After:
  x is 6
  y is 9
  ```

  While this version of `change_number()` *does* use pass-by-reference (unlike the previous problem), the way C interprets the order of operations actually changes the way that the function works!

  Notice that there is only one line in `change_number()`, `*n++`. At first glance, it may seem that it will just dereference the pointer stored in `n` and increment it, effectively incrementing both `x` and `y` by 1. However this is false!

  In the order of operations, the post-increment operation (`++`) comes *before* the dereference operation! In reality, `*n++` may be better expressed as `*(n++)`. What this line does is first increment the *address* stored in `n` (not what you expected!), then dereferences this new address. No actual changes are made to the *value* pointed to by `n`.

  This can also lead to memory violations if a piece of memory is dereferenced that you were not expecting or were not in control of!

\newpage

5. What will this program print if executed? What is the difference between this and the previous two problems?

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

  **Answer:**

  ```
  Before:
  x is 6
  y is 9
  After:
  x is 7
  y is 10
  ```

  Unlike the previous two problems, this version of `change_number()` actually increments `x` and `y`! Notice that parentheses have been placed around "`*n`" so that the address stored in `n` is dereferenced, then any changes to it are reflected in the original `x` and `y` variables.

  A safe way to ensure that you get the behavior you expect with your programs is to simply write out the increment operation fully, like as:

  ``` c
  *n = *n + 1;
  ```

---

\newpage

## More Advanced Function Scope

6. Fill in this `swap()` function to swap the values referenced by two pointers.

  **Sample Answer:**

  ``` c
  #include <stdio.h>

  void swap(int *a, int *b)
  {
    int tmp = *a;
    *a = *b;
    *b = tmp;
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

\newpage

7. What will this program print if executed?

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

  **Answer:** `*c = 19`

\newpage

8. What will this program print if executed?

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

  **Answer:** `*c = 17`

---

\newpage

## Pointers and Arrays

9. What does `array` contain after line 13? What will this program print if executed?

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

  **Answer:**

  `array` contains the following values: `[0, 10, 20, 30, 40, 50, 60, 70, 80, 90]`

  The program prints:

  ```
  0
  10
  20
  30
  40
  50
  60
  70
  80
  90
  ```

\newpage

10. What will `array` contain after line 34? What will this program print if executed?

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

  **Answer:**

  `array` contains the following values: `[50, 51, 52, 53, 54, 55, 56, 57, (garbage value), (garbage value)]`

  The program may print:

  ```
  [50, 51, 52, 53, 54, 55, 56, 57, -381609296, 32694]
  ```