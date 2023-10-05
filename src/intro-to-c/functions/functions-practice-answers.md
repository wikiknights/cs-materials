---
title: Functions (Solutions)
author:
  - Jerrett Longworth
  - Idel Martinez
---

## Variable Scope

This is one of the most important topics in programming, especially in the C language. This starts by looking at variable scope without functions, then bringing them into the mix later.

@. Will this code compile? Explain why or why not. If it does compile, what will be printed?

  ``` {.c .numberLines}
  #include <stdio.h>

  int main(void)
  {
    int my_number = 5;
    printf("The value of my_number is: %d\n", my_number);

    {
      int my_number = 10;
    }

    printf("The value of my_number is: %d\n", my_number);

    return 0;
  }
  ```

  **Answer:**

  This code compiles! Normally, variables with the same name can't be declared twice in the same function. (A compiler would give you an error like "`redefinition of ‘my_number’`".) In this case, this is actually considered valid due to differences in variable scope!

  The first `my_number` declared on line 5 has a scope of the entire `main()` function. This is because the innermost pair of curly braces at this line are the ones used to define this function.

  Scope of first `my_number` visually:

  ``` {.c .numberLines}
    #include <stdio.h>
  
    int main(void)
  ┌─{────────────────────────────────────────────────────────┐
  │   int my_number = 5;                                     │
  │   printf("The value of my_number is: %d\n", my_number);  │
  │                                                          │
  │   {                                                      │
  │     int my_number = 10;                                  │
  │   }                                                      │
  │                                                          │
  │    printf("The value of my_number is: %d\n", my_number); │
  │                                                          │
  │   return 0;                                              │
  └─}────────────────────────────────────────────────────────┘
  ```

  The second `my_number` declared on line 9 also has a scope of the innermost pair of curly braces it is defined in. Looking closely, we see that while it doesn't contain much meaningful code, the pair of curly braces still create another scope. Since this scope is different from the previous variable, they are considered two separate variables.

  Scope of second `my_number` visually:

  ``` {.c .numberLines}
  #include <stdio.h>

  int main(void)
  {
    int my_number = 5;
    printf("The value of my_number is: %d\n", my_number);

  ┌─{────────────────────────────────────────────┐
  │   int my_number = 10;                        │
  └─}────────────────────────────────────────────┘

    printf("The value of my_number is: %d\n", my_number);

    return 0;
  }
  ```

  Program output:

  ```
  The value of my_number is: 5
  The value of my_number is: 5
  ```

  The value of `my_number` is still 5 in both of the printed statements due to this difference in scope. Both `printf()` statements are inside `main()`, but are not inside the inner pair of curly braces, so they refer to the first `my_number`.

\newpage

## Variable Scope with Functions
This is important to get right. Functions are the base of every program, and knowing what your variables are doing in them is crucial.

@. Fill in the blank so that all the types match correctly. By the way... What do lines 10 and 15 print?

  ``` {.c .numberLines}
  int add_everything(int num1, int num2)
  {
    return num1 + num2;
  }

  int main(void)
  {
    int x, y;

    printf("%d\n", add_everything(10, 5));

    x = 20;
    y = 15;

    printf("%d\n", add_everything(x, y));

    return 0;
  }
  ```

  **Answer**: Line 10 prints 15 while line 15 prints 35.

\newpage

@. What happens when you return a value from a function? Things can get tricky if you're snoozing... What's the value of `floaty_float` after the execution of this program, assuming the user enters `5`?

  ``` c
  void get_value(float f)
  {
    scanf("%f", &f);
    f = f + 0.5;
  }

  int main(void)
  {
    float floaty_float;
    get_value(floaty_float);

    printf("%f\n", floaty_float);

    return 0;
  }
  ```

  **Answer:** `floaty_float` actually has no defined value! `get_value()` does not affect `floaty_float` since the function makes a copy of it when it is passed by value. The copy, called `f`, stores the new integer, as provided, and so `f` does indeed become 5.5. However, `f` only exists within the `get_value()` function, so it is discarded once the function ends.

\newpage

@. What if the previous example is altered a little? What happens to `floaty_float`? Assume, again, that the user enters `5`.

  ``` c
  float get_value(void)
  {
    float f;
    scanf("%f", &f);
    return f + 15.5;
  }

  int main(void)
  {
    float floaty_float;
    floaty_float = get_value();

    printf("%f\n", floaty_float);

    return 0;
  }
  ```

  **Answer:** `20.5`. This time, `get_value()` returns a float, and thus changes `floaty_float`. There will be times later in the semester where we actually *can* change a variable without returning it, but we will get to that when the time comes.

\newpage

@. What will `main` print in lines 10, 12, and 14?

  ``` {.c .numberLines}
  void add_num(int x, int y)
  {
    x = x + y;
  }

  int main(void)
  {
    int x = 10;

    printf("At first x was %d\n", x);
    add_num(20, 10);
    printf("Now x is %d\n", x);
    add_num(x, 10);
    printf("While x is now %d\n", x);

    return 0;
  }
  ```

  **Answer:**

  ```
  At first x was 10
  Now x is 10
  While x is now 10
  ```

\newpage

@. What will `main` print in lines 12, 14, and 16?

  ``` {.c .numberLines}
  int x; // A wild global variable has appeared!

  void add_num(int y)
  {
    x = x + y;
  }

  int main(void)
  {
    x = 10;

    printf("At first x was %d\n", x);
    add_num(20);
    printf("Now x is %d\n", x);
    add_num(10);
    printf("While x is now %d\n", x);

    return 0;
  }
  ```

  **Answer:**

  ```
  At first x was 10
  Now x is 30
  While x is now 40
  ```

---

\newpage

## Creating Functions

@. Define a function that calculates the slope between two points using this fancy function header:

  **Answer:**

  ``` c
  // Return the slope of two points.
  double slope(float x1, float y1, float x2, float y2)
  {
    // This is the function body. Your code goes here.
    double numerator = y2 - y1;
    double denominator = x2 - x1;
    double slope = numerator / denominator;

    return slope;

    /*
     * The above statements are equivalent to this:
     *
     * return (y2 - y1) / (x2 - x1);
     *
     * So we don't even need additional variables to return some value!
     */
  }

  int main(void)
  {
    double point_x1 = 10;
    double point_x2 = 40.55;
    double point_y1 = 98.122321;
    double point_y2 = 12;

    printf("The first point is: (%lf.2, %lf.2)\n" point_x1, point_y1);
    printf("The second point is: (%lf.2, %lf.2)\n", point_x2, point_y2);
    printf("The slope of the points is %lf\n", slope(point_x1, point_y1, point_x2, point_y2));

    return 0;
  }
  ```

\newpage

@. **CHALLENGE:** Define a function that accomplishes the following task using the function **header**: (Hint: You may use the `sqrt()` function provided by the `math.h` library.)

  **Answer:**

  ``` c
  // Return the distance between two points.
  double distance_between_points(float x1, float y1, float x2, float y2)
  {
    // Using the math library, we can do all sorts of cool stuff!

    // If you write it out, what does this statement do?
    return sqrt(pow(x2 - x1, 2) + pow(y2 - y1, 2));
  }

  int main(void)
  {
    double p_x1, p_x2, p_y1, p_y2;

    printf("Please enter the first point\n");
    printf("> x: ");
    scanf("%lf", &p_x1);
    printf("> y: ");
    scanf("%lf", &p_y1);

    printf("Please enter the second point\n");
    printf("> x: ");
    scanf("%lf", &p_x2);
    printf("> y: ");
    scanf("%lf", &p_y2);

    /*
     * Before we run the distance_between_points function, do we have to check if
     * any values can make our program break?
     */

    printf("The distance between these two points is %lf\n", distance_between_points(p_x1, p_y1, p_x2, p_y2));

    return 0;
  }
  ```

---

\newpage

## Functions with Loops

@. **CHALLENGE BONUS:** Write a `mario()` function that prints an `m` x `n` block using `#` characters.

  **Answer:**

  ``` c
  // Example output:

  // mario(3, 4) should print:
  // ###
  // ###
  // ###
  // ###

  // mario(1, 1) should print:
  // #

  // mario(10, 5) should print:
  // ##########
  // ##########
  // ##########
  // ##########
  // ##########

  void mario(int m, int n)
  {
    // Did you know... you can declare variables right in a for loop!
    for (int row = 0; row < m; row++)
    {
      for (int col = 0; col < n; col++)
      {
        printf("#");
      }
      printf("\n");
    }
  }

  int main(void)
  {
    int m, n;

    printf("Enter a width: ");
    scanf("%d", &m);
    printf("Enter a height: ");
    scanf("%d", &n);

    mario(m, n);

    return 0;
  }
  ```

  Fun fact: This problem is based on the one seen in [CS50](https://cs50.harvard.edu/x/2021/psets/1/mario/less/).