---
title: Array Introduction
author: Bed Pandey, Carson Cox
---

<h1>TODO</h1>
<h2>This page is under construction!!!</h2>

Arrays can be used to represent a collection of items with the same datatype. For instance, let's say we wanted an array to represent the grades our class got for a test in our hypothetical class of size 5.

```
+------+------+------+------+------+
| 92.5 | 52.4 | 75.0 | 82.0 | 88.9 |
+------+------+------+------+------+
```

This is a common representation of an array, a one-dimensional grid with a specific size. Since our array should have 5 grades, we have 5 separate cells we can put our data in.

But how do we do this in C?!

## Creating Arrays
To create an array, we need to specify the datatype, a variable name, and the size of the array:

```c
float grades[5];
```
Here, we just created an array of size 5 with a datatype of `float`, meaning each element in this array should be a `float`. 

We can also have different types:

```c
int pineapples[10];     // integer array of size 10
double coordinates[4];  // double array of size 4
char word[4];           // char array of size 4 - also a string, sneak peak!
```

However, we have only just created the array to hold our grades in, but not actually put anything in it. Our array is currently empty. So, how do we put our grades into our array?

## Populating our Array
Currently, our array (essentially) looks like this:

```
+------+------+------+------+------+
|      |      |      |      |      |
+------+------+------+------+------+
```

It's empty and barren. Let's put some grades into it!

To access each cell in an array, we have to know what _index_ we want to access first. The index represents the location of a cell in an array. An important thing to note about C (and many other programming languages) is that array indexes start at **0**.

What does this mean? Well, if we wanted the index of the first cell, we wouldn't use 1. Instead, we would use 0 to represent the first cell in an array. This also means that if we wanted to access the last cell in an array, we would use `n - 1`, `n` being the size of the array. For instance, in our `grades` array of size 5, if we wanted to access the last element, we would use index 4, since we start from 0 for our indexes.

To access an index in an array, we can use brackets (`[]`).
Here, let's access the first cell of `grades`, and assign the first cell to `92.5`:

```c
grades[0] = 92.5; // first cell of the grades array will have an index of 0
```

Great! Now we have one grade in... but what about the rest?
Our array currently looks like this now:

```
+------+------+------+------+------+
| 92.5 |      |      |      |      |
+------+------+------+------+------+
```

We've populated the first cell with a grade, by using our array access operator. We can do this for the rest of the grades as well:

```c
grades[0] = 92.5;
grades[1] = 52.4;
grades[2] = 75.0;
grades[3] = 82.0;
grades[4] = 88.9;
```

Here is what our array looks like now:

```
+------+------+------+------+------+
| 92.5 | 52.4 | 75.0 | 82.0 | 88.9 |
+------+------+------+------+------+
```

Now we finally have our array full of grades! Obviously, this is a pretty tedious way to populate our array; we just manually typed out the grades for each student! However, there are other ways in which we can initialize and populate an array:

## Other Ways to Create and Populate an Array

### Initializer List
If we already know what will be in our array, we can create an array like this, using what is called an initializer list:
```c
int favorite_numbers[] = {3, 5, 9, 2184, 1, 3141592};
```
Notice how we didn't need to specify the size of the array. This is because we used curly brackets (`{}`) to 'initialize' our array inline, so C will automagically create our array with the smallest size needed to house all of our elements. We can verify this by using `sizeof`:

<details>
<summary>Show code</summary>

```c
#include <stdio.h>
int main(void) {
    // array of integers, with 6 numbers inside of it:
	int favorite_numbers[] = {3, 5, 9, 2184, 1, 3141592};
    // use sizeof to calculate the size of the array:
    // you don't need to know how this works for now,
    // but just know that this formula will give us the size of our array
	int array_size = sizeof(favorite_numbers) / sizeof(int);
	printf("length of the array: %d\n", array_size);
	return 0;
}
```
```
$ ./a.out
length of the array: 6
```
</details>

Neat tech! Of course, we can still put the size if we wanted, but **be careful** to not overstep the bounds of the array:
```c
// using an initializer list for our grades array from the beginning
float grades[5] = {92.5, 52.4, 75.0, 82.0, 88.9};

// *** DON'T DO THIS! We're overstepping our bounds! ***
int numbers[3] = {1, 2, 3, 4, 5}; // array of size 3 with 5 elements?! uh oh...
```

### Loops
We can also use loops to initialize our array, such as a for loop. Can you guess what our array will look like after running this code?

```c
int numbers[5];
for (int i = 0; i < 5; i++) {
    numbers[i] = i*2;
}
```
<details>
<summary>Reveal answer</summary>
`[  0  |  2  |  4  |  6  |  8  ]`
</details>

