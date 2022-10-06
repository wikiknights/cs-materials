---
title: Functions
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

## Variable Scope with Functions
This is important to get right. Functions are the base of every program, and knowing what your variables are doing in them is crucial.

@. Fill in the blank so that all the types match correctly. By the way... What do lines 10 and 15 print?

  ``` {.c .numberLines}
  _____ add_everything(_____ num1, int num2)
  {
    return num1 + num2;
  }

  int main(void)
  {
    int x, y;

    printf("%_____\n", add_everything(10, 5));

    x = 20;
    y = 15;

    printf("%d\n", add_everything(x, y));

    return 0;
  }
  ```

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

@. What will `main` print in lines 12, 14, and 16?

  ``` {.c .numberLines}
  int x;

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

---

## Creating Functions

@. Define a function that calculates the slope between the two points using the fancy function header:

  ``` c
  // Return the slope of two points.
  double slope(float x1, float y1, float x2, float y2)
  {
    // This is the function body. Your code goes here.
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

@. **CHALLENGE:** Define a function that accomplishes the following task using the function **header**: (Hint: You may use the `sqrt()` function provided by the `math.h` library.)

  ``` c
  // Return the distance between two points.
  double distance_between_points(float x1, float y1, float x2, float y2)
  {
    // Code goes here.
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

    printf("The distance between these two points is %lf\n", distance_between_points(p_x1, p_y1, p_x2, p_y2));

    return 0;
  }
  ```

---

## Functions with Loops

@. **CHALLENGE BONUS:** Write a `mario()` function that prints an `m` x `n` block using `#` characters.

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
    // Your code here
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
