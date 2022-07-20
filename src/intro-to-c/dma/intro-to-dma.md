---
title: Introduction to Dynamic Memory Allocation
author:
  - Jerrett Longworth
  - Idel Martinez
---

## What exactly is \*\*dynamic\*\* memory?

When we use memory in our computers, memory is stored in a few different places depending on the situation. Generally, this involves a **stack** and a **heap**. This is a representation of how a program stores data in memory:

```
+--------------------------+
|       machine code       |
+--------------------------+
|         globals          |
+--------------------------+
|           heap           |
|            ↓             |
|                          |
|                          |
|                          |
|                          |
|                          |
|                          |
|            ↑             |
|          stack           |
+--------------------------+
```

These two locations in memory operate based on two types of memory allocation: **static allocation** and **dynamic allocation**.

```
+--------------------------+
|       machine code       |
+--------------------------+
|         globals          |
+--------------------------+
|           heap           |    <------- Dynamically allocated
|            ↓             |
|                          |
|                          |
|                          |
|                          |
|                          |
|                          |
|            ↑             |
|          stack           |    <------- Statically allocated
+--------------------------+
```

> *Fun fact:* If too much memory is allocated on the stack, it will "overflow" into the heap. This causes what is known as a "stack overflow." (Not to be confused with [the website](https://stackoverflow.com).)

In the end, the biggest difference between static and dynamic memory is **scope**.

In <span class="underline">static memory</span>, data sticks around within the "curly braces" it was created in. Once either a function ends, a loop completes, or the program terminates, the static memory associated with that scope is returned to be used for other programs.

For example, the integer `n` in this small program will only exist in `funny_function()`, and that information is lost when the function ends:

``` c
#include <stdio.h>

void funny_function(void)
{
  int n = 6;
  printf("The value of n is %d!\n", n);
}

int main(void)
{
  funny_function();
  printf("I can't see the value of n in main()...\n");

  return 0;
}
```

In <span class="underline">dynamic memory</span>, data sticks around **as long as you want**. You can allocate memory and use it at any time, in any function, free-of-charge. You now have full control of where in your program a piece of memory can be used.

---

## Introducing Dynamic Memory Allocation

In C, we have a few functions available in the `stdlib.h` library, one of the most important being `malloc()` (short for **m**emory **alloc**ation).

### So how do I use this `malloc()` thing?

`malloc()` takes one parameter: The amount of memory (in bytes) you would like to allocate.

What if I don't know how many bytes I need? Can I put in a random number? No. You must always decide how much memory you want to allocate.

**Example:**

``` c
// Allocate the memory needed to store 100 integers.
malloc(sizeof(int) * 100);
```

### What does it return?

If successful, `malloc()` returns an *address* to the memory it allocated. We use a pointer to store this address.

``` c
// Now "numbers" is a pointer to the base address of 100 integers.
// In other words, "numbers" is an array of 100 integers.
int *numbers = malloc(sizeof(int) * 100);
```

If `malloc()` fails, it will return `NULL` instead.

``` c
// Attempting to allocate memory for 10,000,000,000 integers.
// There is very likely not enough memory, so malloc() returns NULL.
int *numbers = malloc(sizeof(int) * 10E10);
```

### Let's do some `malloc()`ing!

``` c
#include <stdlib.h>

int main(void)
{
  while (1)
  {
    malloc(sizeof(int));
  }

  return 0;
}
```

Nooooo! This is all wrong.

This program is continuing to allocate memory *without* returning it to other programs. It is *such* a hog, leaking memory all over the floor. Don't be a menace to your computer.

We need some way to return this memory when we're done with it. Since it isn't statically allocated, this is not an automatic process.

---

## Introducing `free()`

![You can become free as a bird with `free()`.](img/free.jpg)\

`free()` can be used to deallocate memory. It takes one parameter: a pointer to dynamically allocated memory.

For example:

``` c
int *pointer = malloc(sizeof(int));
free(pointer);
```

This is all it takes to dynamically allocate memory to an integer, then deallocate it once finished using it.

> **Note:** Only use `free()` with *dynamically* allocated memory. Doing something like:
>
> ``` c
> int x;
> free(&x);
> ```
> 
> will result in **disastrous consequences**. You have been warned.

Going to the previous example, this would be better:

``` c
#include <stdlib.h>

int main(void)
{
  int *pointer;
  while (1)
  {
    pointer = malloc(sizeof(int));
    free(pointer);
  }

  return 0;
}
```

This still causes an infinite loop, but at least you won't be hogging all the memory anymore.

---

## `calloc()`: The Over-Accomplishing Sibling

`calloc()` is like the sibling of `malloc()` that always tries to do more. They are both related, but have differences on what they do. `calloc()` is short for "**c**ontiguous **alloc**ation," and it will allocate memory just like `malloc()`, but also **initialize** the memory to 0, so you have no garbage values right off the bat. In this way, `calloc()` can be useful for making, for example, arrays that would have been initialized anyway.

`calloc()` takes a size and a quantity of that size. For example:

``` c
// Allocate space for 10 integers, and initialize it to 0.
int *numbers = calloc(10, sizeof(int));
```

---

## `realloc()`: I Changed My Mind

There is also a cousin to `malloc()`, called `realloc()`, which allows you re **re-alloc**ate memory. This can be extremely useful if you, for example, want to take an array with an initial size, but expand it later.