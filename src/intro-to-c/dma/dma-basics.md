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

On this line, we are first allocating enough space to store an integer (`malloc(sizeof(int))`), then we are saving this address to `my_number`. We also could have combined this with the previous line, like so:

``` c
int *my_number = malloc(sizeof(int));
```

### `*my_number = 5;` {.unlisted}

With the new memory allocated, `5` can be placed inside the allocated memory.

### `free(my_number);` {.unlisted}

At the end of any program, before it finishes, all dynamically-allocated memory should be freed!