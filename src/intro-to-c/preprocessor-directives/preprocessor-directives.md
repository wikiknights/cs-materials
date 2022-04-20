# Preprocessor Directives

*Created by Jerrett Longworth in February 2022.*

Here's a rundown of how preprocessor directives work and how you can use them in your program!

---

## What is a "preprocessor directive" anyway?

I'm glad you asked! These are statements (or directives) in your program that are looked at *before* anything else, before your program's code is processed. You may recognize one of these directives already, `#include`. Preprocessor directives use the `#` symbol to distinguish themselves.

This lesson will mainly focus on `#include` and `#define` specifically, but will also discuss `#ifdef`, `#ifndef` and `#endif`.

## `#include`

This is a directive that allows you to *include* other code that can be used in your program. This code exists as libraries, like `stdio.h` and `stdlib.h`, and provide many functions used day-to-day, from `printf()` to `pow()`. You can include libraries by simply using `#include <stdio.h>`, or `stdio.h` can be replaced with another library of your choosing.

**Example:**

``` c
#include <stdio.h>

int main(void)
{
  printf("Check it out! Now I can use printf()!\n");

  return 0;
}
```

## `#define`

This allows you to *define* values to be used in your program that only need to be changed in one location.

**Example:**

``` c
#include <stdio.h>

#define MARBLES 10

int main(void)
{
  printf("This program always assumes there are %d marbles!\n", MARBLES);

  return 0;
}
```

`#define`'d values are typically notated in all capital letters, and replace the places where they are used right before compiling. For example, you may consider the following as what is seen after the `#define`'s values are replaced:

``` c
#include <stdio.h>

#define MARBLES 10

int main(void)
{
  printf("This program always assumes there are %d marbles!\n", 10);

  return 0;
}
```

Notice that `MARBLES` was replaced with `10`!

Values created with `#define` are more limited than, for example constant variables, since they cannot change during a program.

``` c
// This will not work!
MARBLES = 30;
```

However, they are considered the better practice in C when there is a value in your program that will not change, no matter when it is run. (The values for pi and Euler's number are in the `math.h` library for example.) This is because `#define`'d values do not take up any additional space when your program runs, but is instead imbedded within the program itself. (For more advanced programmers, values created with `#define` do not need any allocation on a program's stack.)

You can also use floating-point values and strings with `#define`! They work in exactly the same way, by being substituted into the locations where they are used.

**Example:**

``` c
#include <stdio.h>

#define A_FLOAT_VALUE 4.123123
#define A_STRING "Hello, I am a string!"

int main(void)
{
  printf("This is the value in a defined float: %f\n", A_FLOAT_VALUE);
  printf("This is the value in a defined string: %s\n", A_STRING);

  return 0;
}
```

## `#ifdef`, `#ifndef` and `#endif`

Sometimes, you may want to define a value that causes parts of your program to be enabled or disabled quickly! This can be done in combination with `#define`.

See this example:

``` c
#include <stdio.h>

#define DEBUG 1

int main(void)
{
  int x = 5;
  int printf_return;

  printf("This is my program running normally!\n");

  printf_return = printf("Now I will print the value of x: %d\n", x);

#ifdef DEBUG
  printf("[DEBUG] printf() returned the value %d\n", printf_return);
#endif

  return 0;
}
```

`#ifdef` will check *if* an identifier is *def*ined. `#endif` will consequently mark where the if statement ends.

`printf()` actually returns a value, but you may not want this information to be accessible in the program normally. For the sake of debugging however, this may be useful information that is needed by a programmer. By simply changing `DEBUG` between 0 and 1, this can respectively disable or enable lines of code between `#ifdef` and `#endif` statements.

*Note:* `#ifdef` (or any other preprocessor directive) is normally written to ignore normal program indentation, starting at the beginning of the line, but this is not a requirement to use it.

Additionally, you can use `#ifndef` to check *if* an identifier is *not def*ined!