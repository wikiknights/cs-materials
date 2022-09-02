---
title: Dynamic Memory and Pointer Safety
author: Jerrett Longworth
---

With using dynamic memory allocation, there also comes a great deal of responsibility as the programmer to ensure that your pointers and allocations are managed properly. This keeps your programs running in a stable and predictable way, and helps avoid crashing, errors, and memory leaks.

We will take a look at some common memory pitfalls when using dynamically-allocated memory and pointers.

---

## Index Out-of-Bounds

When an array of `n` elements is created, the valid indices that can be used in it are between 0 and `(n - 1)`. Any value greater than `(n - 1)` is outside of the array and is not guaranteed to be available.

**Example:**

``` c
int array[5];
array[5] = 76;
```

(Valid indices are between 0 and 4 inclusive in this case.)

**Same example using dynamic memory:**

``` c
int *array = malloc(sizeof(int) * 5);
array[5] = 76;
```

## Using Uninitialized Memory (Undefined Behavior)

When a variable or piece of memory is allocated, it starts by containing whatever data was in that memory at the time ("garbage data").

Thus, using memory without first giving it a definitive value can cause undefined or unexpected behavior.

**Example:**

``` c
int x;
printf("%d\n", x); // This value of x cannot be predicted.
```

**Same example using dynamic memory:**

``` c
int *x = malloc(sizeof(int));
printf("%d\n", *x);
```

## Dereferencing `NULL`

If a pointer points to `NULL` (or any location that does not exist), this can be acceptable, and even preferred sometimes. `NULL` is commonly used to indicate that a pointer points to nowhere.

However, *using* this pointer will cause your computer to attempt to access memory that it actually can't.

**Example:**

``` c
int *numbers = NULL;
numbers[0] = 10;
```

## Double Free

If some piece of memory is deallocated, it cannot be deallocated a second time.

This is like giving candy to a baby, and then stealing it back just to say the baby can have it again. Don't make the baby cry.

**Example:**

``` c
float *floaty_float = malloc(sizeof(float));
free(floaty_float);
free(floaty_float);
```

## Using After Free

Once you deallocate memory, it cannot come back. They're not coming back, okay? Time to move on.

If a piece of memory has been `free()`'d, it is returned for use by other programs and can no longer be used by yours.

**Example:**

``` c
int *array = malloc(sizeof(int) * 256);
array[0] = 0;
free(array);
printf("%d\n", array[0]);
```

## Memory Leak

A program that does not `free()` all of its dynamically-allocated memory can cause a memory leak.

This is when memory is allocated, but not returned to the operating system, so it remains in "limbo," unable to be used by any program.

**Example:**

``` c
char *string = malloc(sizeof(char) * 10000);
// Program ends.
```

---

Hooray! Dynamic memory is so simple! <sub>(said no one ever)</sub>