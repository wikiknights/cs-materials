---
title: Basics of Dynamic Memory Allocation
author: Jerrett Longworth
---

This guide will start with showing a way to visualize allocation in memory, then will go into some examples on how to use dynamically-allocated memory.

---

## Visual Representation of Pointers

Let's look at memory visually to see what happens in each aspect of pointers. Consider a blank canvas of memory:

```








```

Not much so far! In my code editor, I will add one line to my `main()` function:

``` c
int number;
```

```

  (int)
┌─────────────────────┐
│                     │
│                     │
│                     │
└─────────────────────┘
  number (0x456FA0)




```

Consider this box to represent the space used in memory for this integer. The text above the box indicates the type of data it stores. The text below the box indicates the label used to identify it, as well as its address in memory. (Note: These addresses are only examples and may be different on each computer.)

I can change the code to put a value inside `number`:

``` c
int number = 5;
```

```

  (int)
┌─────────────────────┐
│                     │
│         5           │
│                     │
└─────────────────────┘
  number (0x456FA0)




```

Now let's introduce pointers and show how things change!

``` c
int *pointer;
```

```

  (int*)
┌─────────────────────┐
│                     │
│                     │
│                     │
└─────────────────────┘
  pointer (0x456FB8)



```

We have another box this time, but one that contains a pointer! I will now combine the previous steps, and do some pointing.

``` c
int number = 5;
int *pointer = &number;
```

```

  (int)                         (int*) 
┌─────────────────────┐       ┌─────────────────────┐
│                     │       │                     │
│         5        <──┼───────┼───   0x456FA0       │
│                     │       │                     │
└─────────────────────┘       └─────────────────────┘
  number (0x456FA0)             pointer (0x456FB8) 



```

Boom! As you can see, `pointer` is *pointing* to the address of `number`. (`&number` is equivalent to `0x456FA0`.)

As an example, if we then dereference `pointer`, we could access and modify the value inside of `number`.

``` c
int number = 5;
int *pointer = &number;
*pointer = 20;
```

**Final result:**

```

  (int)                         (int*) 
┌─────────────────────┐       ┌─────────────────────┐
│                     │       │                     │
│         20       <──┼───────┼───   0x456FA0       │
│                     │       │                     │
└─────────────────────┘       └─────────────────────┘
  number (0x456FA0)             pointer (0x456FB8) 



```

By dereferencing `pointer`, we can "follow the arrow" to `number`, where we can access and modify the value inside another variable! Let's now see how this works for dynamic memory allocation.

---

## Visual Representation of Dynamic Memory Allocation

Let's start with a call to `malloc()`, and save the result to a variable.

``` c
int *pointer = malloc(sizeof(int));
```

**Final result:**

```

  (int*)                        (int) 
┌─────────────────────┐       ┌─────────────────────┐
│                     │       │                     │
│      0x964128    ───┼───────┼-->                  │
│                     │       │                     │
└─────────────────────┘       └─────────────────────┘
  pointer (0x309AB0)            (0x964128) 



```

The box on the left is created with the integer pointer declaration `int *pointer`. The box on the right is created with the call to `malloc(sizeof(int))`.

In this case, notice that `pointer` is pointing to an integer, like before, but the "box" containing an integer has no label! One of the strengths of dynamic memory (if used wisely) is that not every piece of allocated memory has a direct label.

Let's see one final example, of where things could go wrong with dynamic memory!

``` c
int number = 64;
int *pointer = malloc(sizeof(int));
pointer = &number;
```

**Final result:**

```

  (int)                     (int*)                        (int) 
┌─────────────────────┐   ┌─────────────────────┐       ┌─────────────────────┐
│                     │   │                     │       │                     │
│         64       <──┼───┼───   0x309AB0       │       │                     │
│                     │   │                     │       │                     │
└─────────────────────┘   └─────────────────────┘       └─────────────────────┘
  number (0x309AB0)         pointer (0x309AB4)            (0x964128) 



```

In this case, notice how there is no label or pointer that can get to the piece of allocated memory at address `0x964128`! If this happens, this is what is called a *memory leak*, where a piece of allocated memory has "leaked" and can no longer be accessed. In good practice, all allocated memory should always be freed. This would be a version without the memory leak:

``` c
int number = 64;
int *pointer = malloc(sizeof(int));
free(pointer);
pointer = &number;
```

**Final result:**

```

  (int)                     (int*)               
┌─────────────────────┐   ┌─────────────────────┐
│                     │   │                     │
│         64       <──┼───┼───   0x309AB0       │
│                     │   │                     │
└─────────────────────┘   └─────────────────────┘
  number (0x309AB0)         pointer (0x309AB4)   



```

Notice the dynamically-allocated block of memory has been freed, removing it from your concern as the programmer.

We will now walk through a few examples in practice of actually using dynamic memory allocation!

---

## Example 1: Allocating an Integer

**The code:**

``` c
#include <stdio.h>
#include <stdlib.h>

int main(void)
{
  int *my_number;

  my_number = malloc(sizeof(int));

  *my_number = 5;
  printf("My number is %d\n", *my_number);

  free(my_number);

  return 0;
}
```

Let's walk through parts of this code example and see how it works!

### `#include <stdlib.h>` {.unlisted}

When using the `malloc()` and `free()` functions, you will need to make sure you include `stdlib.h`. You will likely get an "implicit declaration" message from your compiler otherwise!

### `int *my_number;` {.unlisted}

This declares a new integer pointer, where we will then store a pointer to dynamically-allocated memory.

### `my_number = malloc(sizeof(int));` {.unlisted}

On this line, we are first allocating enough space to store an integer (`malloc(sizeof(int))`), then we are saving this address to `my_number`. Make sure that the datatype passed to `sizeof()` is the same as the datatype of the variable. We also could have combined this with the previous line, like so:

``` c
int *my_number = malloc(sizeof(int));
```

### `*my_number = 5;` {.unlisted}

With the new memory allocated, `5` can be placed inside the allocated memory. Notice that the dereference operator (`*`) is necessary to modify the value at the address that `my_number` stores.

### `printf("My number is %d\n", *my_number);` {.unlisted}

This is almost like any other `printf()` statement, but the dereference operator is used to get the value pointed to by `my_number`.

### `free(my_number);` {.unlisted}

At the end of any program, before it finishes, all dynamically-allocated memory should be freed!


You can imagine as this program runs, once it reaches the line containing the `printf()` statement, the memory used by the program may look like the following:

```

  (int)                     (int*)               
┌─────────────────────┐   ┌─────────────────────┐
│                     │   │                     │
│         5        <──┼───┼───   0x549AAC       │
│                     │   │                     │
└─────────────────────┘   └─────────────────────┘
  (0x549AAC)                my_number (0x863990)   



```

---

## Example 2: Allocating an Array

In this example, let's see what it might look like to allocate an array of `double`s! The following code allocates an array of 5 `double`s, puts values in the array, then prints them out.

**The code:**

``` c
#include <stdio.h>
#include <stdlib.h>

int main(void)
{
  double *grades;

  grades = malloc(sizeof(double) * 5);

  grades[0] = 89.5;
  grades[1] = 56.4;
  grades[2] = 98.1;
  grades[3] = 89.9;
  grades[4] = 87.3;

  for (int i = 0; i < 5; i++)
  {
    printf("grades[%d] = %lf\n", i, grades[i]);
  }

  free(grades);

  return 0;
}
```

Let's break down the code line-by-line!

### `double *grades;` {.unlisted}

Similar to before, this declares a variable that contains a pointer to a `double`.

### `grades = malloc(sizeof(double) * 5);` {.unlisted}

`malloc()` allocates enough memory to store 5 consecutive `double`s. Like the previous example, note that the datatype in `sizeof()` should match the datatype of the variable storing the pointer.

### `grades[...] = ...;` {.unlisted}

For these lines, we are performing a 3-step process:

- Add the address `grades` with the offset in the square brackets. (`grades + ...`)
- Dereference the address given by the previous sum. (`*(grades + ...)`)
- Assign the value at the address. (`*(grades + ...) = ...`)

Note that due to this process, as an example, the first assignment is equivalent to the following:

``` c
*(grades + 0) = 89.5;
```

### For loop {.unlisted}

This is a standard for loop that simply prints the value in each index of the array.

### `free(grades);` {.unlisted}

Before your program finishes, you must always make sure to free any dynamically-allocated memory. In this case, although there were multiple `double`s allocated, this was done with a single call to `malloc()`, meaning only a single call to `free()` is necessary to free all memory.


While the for loop is running, you can imagine that the memory used by the program looks like the following:

```

  (double*)
┌─────────────────────┐
│                     │
│      0x784030    ───┼───┐
│                     │   │
└─────────────────────┘   │
  grades (0x289100)       │
                          │
                          │
            ┌─────────────┘
            │
            │
  (double)  │           (double)              (double)              (double)              (double)             
┌───────────v─────────┬─────────────────────┬─────────────────────┬─────────────────────┬─────────────────────┐
│                     │                     │                     │                     │                     │
│        89.5         │        56.4         │        98.1         │        89.9         │        87.3         │
│                     │                     │                     │                     │                     │
└─────────────────────┴─────────────────────┴─────────────────────┴─────────────────────┴─────────────────────┘
  (0x784030)            (0x784038)            (0x784040)            (0x784048)            (0x784050)           


```