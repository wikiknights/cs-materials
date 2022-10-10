---
title: Variable and Function Scope
author: Jerrett Longworth
---

One of the most important concepts in the C language, as well as many other programming languages, is *scope*.

## What is Scope?

*Scope* is the area of code in a program that a variable exists in. Depending on where a variable is declared in a program, its scope may be different.

The basic rule is simple: if a variable is in scope, it can be used. If a variable is out of scope, it cannot be used.

---

## Simple Scope

Let's take a look at a simple example to see how this works:

``` c
#include <stdio.h>

int main(void)
{
  int peanuts = 5;

  printf("I have %d peanuts.\n", peanuts);

  return 0;
}
```

With this program, the scope of `peanuts` can be imagined as a box surrounding the contents of `main()`.

``` c
  #include <stdio.h>

  int main(void)
┌─{────────────────────────────────────────────────────────┐
│   int peanuts = 5;                                       │
│                                                          │
│   printf("I have %d peanuts.\n", peanuts);               │
│                                                          │
│   return 0;                                              │
└─}────────────────────────────────────────────────────────┘
```

This means the scope of `peanuts` is everywhere within the `main()` function.

In general, the scope of any given variable is **between the curly braces it is defined in.**

---

Let's see another example:

``` c
#include <stdio.h>

int main(void)
{
  int first_variable = 3;

  printf("The value of first_variable: %d\n", first_variable);

  {
    double second_variable = 8.0;

    printf("The value of second_variable: %lf\n", second_variable);
  }

  return 0;
}
```

Notice this time the extra pair of curly braces surrounding `second_variable`! Let's take a look at the scope of each variable:

**Scope of `first_variable`:**

``` c
  #include <stdio.h>

  int main(void)
┌─{─────────────────────────────────────────────────────────────────────┐
│   int first_variable = 3;                                             │
│                                                                       │
│   printf("The value of first_variable: %d\n", first_variable);        │
│                                                                       │
│   {                                                                   │
│     double second_variable = 8.0;                                     │
│                                                                       │
│     printf("The value of second_variable: %lf\n", second_variable);   │
│   }                                                                   │
│                                                                       │
│   return 0;                                                           │
└─}─────────────────────────────────────────────────────────────────────┘
```

**Scope of `second_variable`:**

``` c
#include <stdio.h>

int main(void)
{
  int first_variable = 3;

  printf("The value of first_variable: %d\n", first_variable);

┌─{─────────────────────────────────────────────────────────────────────┐
│   double second_variable = 8.0;                                       │
│                                                                       │
│   printf("The value of second_variable: %lf\n", second_variable);     │
└─}─────────────────────────────────────────────────────────────────────┘

  // `second_variable` cannot be accessed here!

  return 0;
}
```

Notice that since `second_variable` is declared in the inner pair of curly braces, it has a more limited scope than `first_variable`. The boxes represent a strict limitation of where those variables can be accessed.

> **Note:** Variables can be declared with the same name in a program *as long as they are in different scopes.* For example, the following is considered valid code:
>
> ``` c
> #include <stdio.h>
>
> int main(void)
> {
>   int apples = 5;
>
>   {
>     // Normally, you can't declare another variable of the same name. But
>     // in this case, it works because the second `apples` is in a different
>     // scope from the first `apples`.
>     int apples = 4;
>   }
>
>   return 0;
> }
> ```

---

## Function Scope

Functions introduce a new layer of complexity with scope, but is essentially the same as what we have seen so far. Let's check out another example, this time with functions:

``` c
#include <stdio.h>

void my_function(int x)
{
  x = x + 5;
}

int main(void)
{
  int x = 5;

  printf("Before my_function: x = %d\n", x);

  my_function(x);

  printf("After my_function: x = %d\n", x);

  return 0;
}
```

What do you expect the value of `x` to be after the call to `my_function()`? Let's see:

```
Before my_function: x = 5
After my_function: x = 5
```

Even though `x` was passed into `my_function()`, it remains 5, rather than being incremented by 5 to 10! This is once again due to function scope.

In this case, we actually have two different variables with the name `x` with two different scopes:

**Scope of the `x` in `main()`:**

``` c
  #include <stdio.h>

  void my_function(int x)
  {
    x = x + 5;
  }

  int main(void)
┌─{──────────────────────────────────────────────┐
│   int x = 5;                                   │
│                                                │
│   printf("Before my_function: x = %d\n", x);   │
│                                                │
│   my_function(x);                              │
│                                                │
│   printf("After my_function: x = %d\n", x);    │
│                                                │
│   return 0;                                    │
└─}──────────────────────────────────────────────┘
```

**Scope of the `x` in `my_function()`:**

``` c
  #include <stdio.h>

┌─void my_function(int x)────┐
│ {                          │
│   x = x + 5;               │
└─}──────────────────────────┘

  int main(void)
  {
    int x = 5;

    printf("Before my_function: x = %d\n", x);

    my_function(x);

    printf("After my_function: x = %d\n", x);

    return 0;
  }
```

These are two different scopes! This essentially means that any changes to `x` within `my_function()` *will not* affect the value of `x` within `main()`.

To allow the `x` in `main()` to be modified, you can return the value of `x` from `my_function()`. Let's see what's new:

``` c
#include <stdio.h>

// my_function() becomes an `int` type function.
int my_function(int x)
{
  x = x + 5;
  return x; // We are now returning `x` here.
}

int main(void)
{
  int x = 5;

  printf("Before my_function: x = %d\n", x);

  // `x` is assigned the return value of my_function().
  x = my_function(x);

  printf("After my_function: x = %d\n", x);

  return 0;
}
```

The output would now be as follows:

```
Before my_function: x = 5
After my_function: x = 10
```

---

## Function Scope (Continued)

Something important to know as well is that the names of variables passed between functions can be different, and are functionally the same. See this example where `x` is changed to `y`:

``` c
#include <stdio.h>

int my_function(int x)
{
  x = x + 5;
  return x;
}

int main(void)
{
  // The variable `x` in main() is now called `y`.
  int y = 5;

  printf("Before my_function: y = %d\n", y);

  y = my_function(y);

  printf("After my_function: y = %d\n", y);

  return 0;
}
```

The output remains the same:

```
Before my_function: y = 5
After my_function: y = 10
```

See this visual representation of how variables pass into functions:

**Image 1: `y` passes to `my_function():`**

``` c
#include <stdio.h>
              ┌───────┐
int my_function(int x)│
{             └─────^─┘
  x = x + 5;        │
  return x;         │
}                   │
                    │
int main(void)    ┌─┘
{                 │
  int y = 5;      │
                  │
  printf("Before m│_function: y = %d\n", y);
                  │
  y = my_function(y);
  
  printf("After my_function: y = %d\n", y);

  return 0;
}
```

**Image 2: `x` returns from `my_function():`**

``` c
#include <stdio.h>

int my_function(int x)
{
  x = x + 5;
  return x; ─────────────────────────────────────────┐
}                                                    │
                                                     │
int main(void)                                       │
{                                                    │
  int y = 5;                                         │
                                                     │
  printf("Before my_function: y = %d\n", y);         │
     ┌───────────────┐                               │
  y =│my_function(y);<───────────────────────────────┘
     └───────────────┘
  printf("After my_function: y = %d\n", y);

  return 0;
}
```

Other than cases like this of passing or returning values, variables cannot be accessed or modified outside its scope.