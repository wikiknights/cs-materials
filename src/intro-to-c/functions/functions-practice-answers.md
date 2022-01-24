# Functions (Solutions)

*Originally created by Jerrett Longworth and Idel Martinez in Spring 2021.*

## Function Scope
This is important to get right. Functions are the base of every program, and knowing what your variables are doing in them is crucial.

1. Fill in the blank so that all the types match correctly. By the way... What do lines 10 and 15 print?

  ``` c lineNumber
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

2. What happens when you return a value from a function? Things can get tricky if you're snoozing... What's the value of `floaty_float` after the execution of this program, assuming the user enters `5`?

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

3. What if the previous example is altered a little? What happens to `floaty_float`? Assume, again, that the user enters `5`.

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

4. Define a function that calculates the slope between two points using this fancy function header:

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

5. **CHALLENGE:** Define a function that accomplishes the following task using the function **header**:

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

\newpage

## Loops

6. **CHALLENGE BONUS:** Write a `mario()` function that prints an `m` x `n` block using `#` characters.

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
