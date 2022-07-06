# Pointers Practice (Solutions)

*Created by Jerrett Longworth in June 2022.*

Let's try some example problems using pointers!

---

## Basic Pointer Operations

@. What will this program print if executed?

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

  **Answer:** `43`

  This is a trick question! The reference and dereference operators cancel each other out, so with the same number of each operator, you are simply left with `n` to print.

---

\newpage

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

@. Fill in this `swap()` function to swap the values referenced by two pointers.

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

@. What will this program print if executed?

  ``` {.c .numberLines}
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

  For this problem, we will step through each line to see the values of `b` (and consequently `*c`) as the program progresses.

  On line 14, `b` stores the value 17. Then on line 15, the `functiomatic()` function is called, and the program moves to line 5.

  At the start of the function, `n` is storing the address of `b` from `main()`, and `*n` currently stores the value 17.

  On line 5, "`*n + 1`" resolves to "`17 + 1`", which is 18. `*n` is then assigned to this value 18, making the `b` in `main()` also equal to 18.

  The function then completes on line 6, by returning "`*n + 1`" which based on the new value of `*n`, resolves to `18 + 1`, which is 19. `functiomatic()` returns 19.

  The program returns to line 15 in `main()`. With `functiomatic()` now finished, this line boils down to "`b = 19`", using the return value of 19.

  On line 16, `c` (an integer pointer) is assigned to the address of `b`. This means that the value contained in `*c` is the same as that in `b`.

  At the end of the program, `*c = 19`.

\newpage

@. What will this program print if executed?

  ``` {.c .numberLines}
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

  This is a small variation of the previous problem that changes a pass-by-reference to a pass-by-value. Effectively, this means that unlike before, the value of `b` is not changed during `functiomatic()`.

  We will again step through each line to see the values of `b` as the program progresses.

  On line 14, `b` stores the value 17. Then on line 15, the `functiomatic()` function is called, and the program moves to line 5.

  At the start of the function, `n` is storing the *integer* from `b`, which is 17.

  On line 5, "`n + 1`" resolves to "`17 + 1`", which is 18. `m` is then assigned to this value 18, which does nothing to the value of `b` in `main()`.

  The function then completes on line 6, by returning "`n`", which is unchanged from the beginning of the function, remaining as 17. `functiomatic()` returns 17.

  The program returns to line 15 in `main()`. With `functiomatic()` now finished, this line boils down to "`b = 17`", using the return value of 17.

  On line 16, `c` (an integer pointer) is assigned to the address of `b`. This means that the value contained in `*c` is the same as that in `b`.

  At the end of the program, `*c = 17`.

---

\newpage

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

  Notice that line 20 is printing "`*(array + i)`". Behind the scenes, this is equivalent to "`array[i]`". This program prints the array as any other loop would.

\newpage

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

  **Answer:**

  `array` contains the following values: `[50, 51, 52, 53, 54, 55, 56, 57, (garbage value), (garbage value)]`

  Notice that `initialize_array()` is called with a provided length of "`LENGTH - 2`", meaning that this function "believes" that the array only has 8 elements (instead of 10) to fill with values. This function operates by starting with the first value of 50, and increments by 1 until the 8th element of the array is reached.

  Since the last two indices of the array are never touched until the `print_array()` function, they remain as uninitialized, garbage values. As a result, there is no way of knowing exactly what will be in `array[8]` and `array[9]`, but as an example, the following may be printed:

  ```
  [50, 51, 52, 53, 54, 55, 56, 57, -381609296, 32694]
  ```

---

\newpage

## Pointers and Structs

@. Create a declaration of a struct called `car` that contains some information about a car: a string (`char` pointer) called `make` that indicates its manufacturer, a string called `model` that indicates its model, an integer called `year` that indicates its year of production, and a double called `mpg` that indicates its fuel efficiency in miles per gallon.

  **Answer:**

  ``` c
  struct car
  {
    char *make;
    char *model;
    int year;
    double mpg;
  };
  ```

\newpage

@. Rewrite the following line of code using the dereference (`*`) and the direct member access (`.`) operator.

  ``` c
  my_struct->number = 5;
  ```

  **Answer:**

  ``` c
  (*my_struct).number = 5;
  ```

\newpage

@. What is wrong with the following `print_planet()` function? How can you fix it?

  ``` c
  struct planet
  {
    char name[30];
    double radius_km;
    char color[30];
  };

  void print_planet(struct planet p)
  {
    printf("Name: %s\n", p->name);
    printf("Radius: %lf\n", p->radius_km);
    printf("Color: %s\n", p->color);
  }
  ```

  **Answer:** The `print_planet()` function is using the indirect reference operator (`->`) on a struct, instead of on a *pointer* to a struct.

  This can be fixed in two ways. In one way, you can change the function declaration to accept a pointer of a struct, so that it is consistent with the `->` operator:

  ``` c
  void print_planet(struct planet *p)
  {
    printf("Name: %s\n", p->name);
    printf("Radius: %lf\n", p->radius_km);
    printf("Color: %s\n", p->color);
  }
  ```

  In another way, you can change the print statements to use the `.` operator, to be consistent with the function declaration:

  ``` c
  void print_planet(struct planet p)
  {
    printf("Name: %s\n", p.name);
    printf("Radius: %lf\n", p.radius_km);
    printf("Color: %s\n", p.color);
  }
  ```

\newpage

@. What will the following program print if executed?

  ``` c
  #include <stdio.h>

  struct pizza
  {
    int radius_inches;
    double price;
    char toppings[100];
  };

  void initialize_pizza(struct pizza *p)
  {
    p->radius_inches = 0;
    p->price = 0;
    p->toppings[0] = '\0';
  }

  void print_pizza(struct pizza p)
  {
    printf("Radius: %d inches\n", p.radius_inches);
    printf("Price: $%0.2lf\n", p.price);
    printf("Toppings: %s\n", p.toppings);
  }

  int main(void)
  {
    struct pizza four_meat_pizza;

    initialize_pizza(&four_meat_pizza);
    print_pizza(four_meat_pizza);

    return 0;
  }
  ```

  **Answer:**

  ```
  Radius: 0 inches
  Price: $0.00
  Toppings:
  ```

\newpage

@. What will the following program print if executed?

  ``` c
  #include <stdio.h>
  #include <string.h>

  struct pizza
  {
    int radius_inches;
    double price;
    char toppings[100];
  };

  void initialize_pizza(struct pizza *p)
  {
    p->radius_inches = 0;
    p->price = 0;
    p->toppings[0] = '\0';
  }

  void print_pizza(struct pizza p)
  {
    printf("Radius: %d inches\n", p.radius_inches);
    printf("Price: $%0.2lf\n", p.price);
    printf("Toppings: %s\n", p.toppings);
  }

  int main(void)
  {
    struct pizza four_meat_pizza;

    initialize_pizza(&four_meat_pizza);

    four_meat_pizza.radius_inches = 13;
    four_meat_pizza.price = 9.99;
    strcpy(four_meat_pizza.toppings, "Pepperoni, beef, sausage, and bacon");

    print_pizza(four_meat_pizza);

    return 0;
  }
  ```

  **Answer:**

  ```
  Radius: 13 inches
  Price: $9.99
  Toppings: Pepperoni, beef, sausage, and bacon
  ```

---

\newpage

## Pointers and Structs (Advanced)

@. Suppose I am teaching an introduction to C programming class at a university, but for some reason this university didn't pick a system to store course material and grades. (Something called "Webcourses" was suggested, but it didn't seem to catch on.) That said, now I want to create my own system of storing student grades. I have some basic code to get started, but it needs some work. How can I set the names of my 3 students in class to "Alice", "Bob", and "Charlie"?

  **Sample Answer:**

  ``` c
  struct gradebook
  {
    char student[128];
    int grades[10];
    double avg;
  };

  typedef struct gradebook gradebook;

  int main(void)
  {
    int n = 3;
    gradebook cop3223[n];

    // Your code goes here
  }
  ```

  **Answer:**

  ``` c
  struct gradebook
  {
    char student[128];
    int grades[10];
    double avg;
  };

  typedef struct gradebook gradebook;

  int main(void)
  {
    int n = 3;
    gradebook cop3223[n];

    // Your code goes here
    strcpy(cop3223[0].name, "Alice");
    strcpy(cop3223[1].name, "Bob");
    strcpy(cop3223[2].name, "Charlie");
  }
  ```

\newpage

@. Fill in the blanks to give students names, calculate their grade average, and print it out.

  **Sample Answer:**

  ``` c
  struct gradebook
  {
    char student[128];
    int grades[10];
    double avg;
  };

  typedef struct gradebook gradebook;

  void calculate_student_avg(gradebook *class, int n)
  {
    double sum;

    for (int i = 0; i < n; i++)
    {
      sum = 0;
      for (int j = 0; j < 10; j++)
      {
        sum += class[i].grades[j];
      }
      class[i].avg = sum / 10;
    }
  }

  void print_averages(gradebook *class, int n)
  {
    for (int i = 0; i < n; i++)
    {
      printf("Average for %s is %lf\n", class[i].student, class[i].avg);
    }
  }

  int main(void)
  {
    int n = 3;
    gradebook cop3223[n];

    // Filling in student grades with data
    for (int i = 0; i < n; i++)
    {
      for (int j = 0; j < 10; j++)
      {
        cop3223[i].grades[j] = (i + 1) * (j + i);
      }
    }

    // Add student names
    strcpy(cop3223[0].student, "Frances E. Allen");
    strcpy(cop3223[1].student, "Barbara Liskov");
    strcpy(cop3223[2].student, "Valerie Taylor");

    // Find average
    calculate_student_avg(cop3223, n);

    // Print average
    print_averages(cop3223, n);

    return 0;
  }
  ```

\newpage

@. I want to create a bank that handles a single person's money, no one elses. This person's balance is divided into how many dollars and cents they have. However, when I run this program (1) the person can withdraw more money than it has, (2) they can deposit a negative amount, (3) they lose all of their cents, (4) their balance is sometimes completely weird, and (5) the `deposit` and `withdraw` functions don't work. How can I solve this?

  **Sample Answer:**

  ``` c
  struct balance
  {
    int dollars;
    int cents;
    double total;
  };

  struct balance get_currency(double amount)
  {
    struct balance money;

    money.dollars = amount;
    money.cents = (int) (amount * 100) % 100;
    money.total = money.dollars + money.cents / 100;

    return money;
  }

  int compare_currency(struct balance temp1, struct balance temp2)
  {
    if (temp1.dollars == temp2.dollars)
    {
      return temp1.cents >= temp2.cents;
    }

    return temp1.dollars > temp2.dollars;
  }

  void deposit(struct balance *checking, double amount)
  {
    struct balance temp = get_currency(amount);

    if (amount > 0)
    {
      checking->dollars += temp.dollars;
      checking->cents += temp.cents;

      if (checking->cents >= 100)
      {
        checking->dollars++;
        checking->cents -= 100;
      }
    }
  }

  void withdraw(struct balance *checking, double amount)
  {
    struct balance temp = get_currency(amount);

    if (compare_currency(*checking, temp))
    {
      checking->dollars -= temp.dollars;
      checking->cents -= temp.cents;

      if (checking->cents < 0)
      {
          checking->dollars--;
          checking->cents += 100;
      }
    }
    else
    {
      printf("Cannot withdraw.\n");
    }
  }

  int main(void)
  {
    struct balance my_checking = {0, 0};

    deposit(&my_checking, -100);
    withdraw(&my_checking, 1E6);

    deposit(&my_checking, 145.54);
    withdraw(&my_checking, 0.01);

    return 0;
  }
  ```
