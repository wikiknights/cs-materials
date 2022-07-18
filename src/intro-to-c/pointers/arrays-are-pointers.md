---
title: Arrays are (Secretly) Pointers
author: Jerrett Longworth
---

What is the relationship between arrays and pointers? It will be assumed that you already know what each are individually. For a quick recap, an array is a consecutive set of values, contiguous in memory. A pointer is an address to a location in memory. But what if I told you that an array is actually just the same as a pointer?


## Arrays in Memory (and Review)

As an example, let's first take a look at what an array of six integers would look like in your computer's memory:

```
+----+----+----+----+----+----+
| 77 | 84 | 52 | 42 | 99 |  3 |
+----+----+----+----+----+----+
```

Notice that each integer is right next to each other in memory.

When accessing values of an array within a program, we use syntax like `array[i]`, to indicate the `i`<sup>th</sup> element of `array`.

Suppose you have the following few lines of code:

``` c
int numbers[6] = {77, 84, 52, 42, 99, 3};

for (int i = 0; i < 6; i++)
{
  printf("numbers[%d] = %d\n", i, numbers[i]);
}
```

This should create straightforward output:

```
numbers[0] = 77
numbers[1] = 84
numbers[2] = 52
numbers[3] = 42
numbers[4] = 99
numbers[5] = 3
```

But what if I just wrote "`numbers`", *without* an index? What would happen? We will now look at how C behaves when only the name of an array is given.


## Using an Array Without an Index

It might look like this in code:

``` c
int numbers[6] = {77, 84, 52, 42, 99, 3};

...

printf("numbers = %p\n", numbers);
```

Sample output:

```
numbers = 0x7ffcc9720930
```

You get... a pointer! In this case, we printed the address "hidden" within the array! But how and why does this work?


## Arrays in Memory, Revisited

Let's look back at this array visually. Notice there is one small addition to the picture.

```
+----+----+----+----+----+----+
| 77 | 84 | 52 | 42 | 99 |  3 |
+----+----+----+----+----+----+
  ^
  |
  |
numbers
```

The name of an array (in this case `numbers`) actually refers to a location in memory, just like a pointer does. Specifically, this will always refer to the location of the first element in the array.


## Array Syntax, Revisited

Keeping in mind that the name of an array refers to the address of its first element, does this mean it could be dereferenced, just like other pointers? Yes!

Let's see this code:

``` c
int numbers[6] = {77, 84, 52, 42, 99, 3};

printf(" numbers = %p\n", numbers);
printf("*numbers = %d\n", *numbers);
```

What do you think the output of this code is?

**Output:**

```
 numbers = 0x7ffcc9720930
*numbers = 77
```

`*numbers` gives 77, the first element of the array!

We could also go backwards to see this relationship. Take the first element of `numbers`, referred to by `numbers[0]`. What if we used the reference operator to get `&numbers[0]`?

``` c
int numbers[6] = {77, 84, 52, 42, 99, 3};

printf(" numbers = %p\n", numbers);
printf("*numbers = %d\n\n", *numbers);

printf(" numbers[0] = %d\n", numbers[0]);
printf("&numbers[0] = %p\n", &numbers[0]);
```

**Sample output:**

```
 numbers = 0x7ffcc9720930
*numbers = 77

 numbers[0] = 77
&numbers[0] = 0x7ffcc9720930
```

Woah! Referencing the first element of the array gives the array's address! This is just another perspective of the same situation. In reality, arrays and pointers are almost one in the same.


## Pointer Arithmetic in Arrays

It turns out that any time square brackets are used to access elements of an array (i.e. `array[3]`), this is a form of pointer arithmetic!

Take a look at the initial picture, but with some more additions:

```
  numbers[0]   numbers[1]   numbers[2]    ...    numbers[5]
+------------+------------+------------+-------+------------+
|     77     |     84     |     52     |  ...  |      3     |
+------------+------------+------------+-------+------------+
  ^            ^            ^                    ^
  |            |            |                    |
  |            |            |                    |
numbers      numbers + 1  numbers + 2          numbers + 5
```

By adding to the address of an array, we can actually get the locations of all other elements in that array! Going further, we can dereference these addresses to get the values stored in the array:

``` c
int numbers[6] = {77, 84, 52, 42, 99, 3};

for (int i = 0; i < 6; i++)
{
  printf("numbers[%d] = %d\n", i, numbers[i]);
}

printf("\n");

for (int i = 0; i < 6; i++)
{
  printf("*(numbers + %d) = %d\n", i, *(numbers + i));
}
```

**Output:**

```
numbers[0] = 77
numbers[1] = 84
numbers[2] = 52
numbers[3] = 42
numbers[4] = 99
numbers[5] = 3

*(numbers + 0) = 77
*(numbers + 1) = 84
*(numbers + 2) = 52
*(numbers + 3) = 42
*(numbers + 4) = 99
*(numbers + 5) = 3
```

As you can see, these two forms are equivalent! Arrays are (secretly) pointers!

---

## Pointer Arithmetic in Different Types of Arrays

Something that C will take care of for you in pointer arithmetic is the "distance" between each element in an array. In other words, even though you may use the same indices in different types of arrays (e.g.: 0, 1, 2, 3, ...), pointer arithmetic will automatically scale depending on the type of pointer/array.

For example, in an array of `int`s, adding 1 is the same as adding 4 bytes to the address of the array, since each `int` takes 4 bytes of space. In an array of `double`s, adding 1 is the same as adding 8 bytes to the address of the array, since each `double` takes 8 bytes of space.

To show this visually, this is the picture of our integer array from before, but with example addresses of each element added, in both hexadecimal and base-10.

```
  numbers[0]   numbers[1]   numbers[2]    ...    numbers[5]
+------------+------------+------------+-------+------------+
|     77     |     84     |     52     |  ...  |      3     |
+------------+------------+------------+-------+------------+
  ^            ^            ^                    ^
  |            |            |                    |
  |            |            |                    |
numbers      numbers + 1  numbers + 2          numbers + 5
(0x1000)     (0x1004)     (0x1008)             (0x1014)
(4096)       (4100)       (4104)               (4116)
```

Now imagine the same array, but with `double`s instead of integers:

```
  numbers[0]   numbers[1]   numbers[2]    ...    numbers[5]
+------------+------------+------------+-------+------------+
|    77.0    |    84.0    |    52.0    |  ...  |     3.0    |
+------------+------------+------------+-------+------------+
  ^            ^            ^                    ^
  |            |            |                    |
  |            |            |                    |
numbers      numbers + 1  numbers + 2          numbers + 5
(0x1000)     (0x1008)     (0x1010)             (0x1028)
(4096)       (4104)       (4112)               (4136)
```

Notice that the way each array is indexed remains the same, but the exact addresses are different, depending on the type of array.

---

## Passing Arrays to Functions

Keep in mind that a pointer and an array aren't all that different from each other. When passing arrays into functions, there are two possible ways to indicate it, and both have the same effect!

``` c
void my_function(int array[], int element_count);
void my_function(int *array, int element_count);
```

Notice that the second variation could then imply passing a pointer *or* an array. It is up to you, the programmer, to make the distinction using your code if this option is chosen.