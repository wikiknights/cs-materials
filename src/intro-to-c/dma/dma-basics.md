---
title: Basics of Dynamic Memory Allocation
author: Jerrett Longworth
---

This guide will start with showing a way to visualize allocation in memory, then will go into some examples on how to use dynamically-allocated memory.

---

## Visual Representation of Memory and Pointer Allocation

Let's look at memory visually to see what happens in each aspect of pointers. Consider a blank canvas of memory:

```








```

Not much so far! In my code editor, I will add one line to my `main()` function:

``` c
int number;
```

```

  (int)
+---------------------+
|                     |
|                     |
|                     |
+---------------------+
  number (0x456FA0)




```

Consider this box to represent the space used in memory for this integer. The text above the box indicates the type of data it stores. The text below the box indicates the label used to identify it, as well as its address in memory. (Note: These addresses are only examples and may be different on each computer.)

I can change the code to put a value inside `number`:

``` c
int number = 5;
```

```

  (int)
+---------------------+
|                     |
|         5           |
|                     |
+---------------------+
  number (0x456FA0)




```

Now let's introduce pointers and show how things change!

``` c
int *pointer;
```

```

  (int*)
+---------------------+
|                     |
|                     |
|                     |
+---------------------+
  pointer (0x456FB8)



```

We have another box this time, but one that contains a pointer!

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

### `#include <stdlib.h>`

When using the `malloc()` and `free()` functions, you will need to make sure you include `stdlib.h`. You will likely get an "implicit declaration" message from your compiler otherwise!

### `int *my_number;`

This declares a new integer pointer, where we will then store a pointer to dynamically-allocated memory.

### `my_number = malloc(sizeof(int));`

On this line, we are first allocating enough space to store an integer (`malloc(sizeof(int))`), then we are saving this address to `my_number`. We also could have combined this with the previous line, like so:

``` c
int *my_number = malloc(sizeof(int))
```

### `*my_number = 5;`

With the new memory allocated, `5` can be placed inside the allocated memory.

### `free(my_number);`

At the end of any program, before it finishes, all dynamically-allocated memory should be freed!