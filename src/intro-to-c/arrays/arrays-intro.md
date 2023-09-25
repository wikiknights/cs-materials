---
title: Array Introduction
author:
    - Bed Pandey
    - Carson Cox
---

Arrays can be used to represent a collection of items with the same datatype. For instance, let's say we wanted an array to represent the grades our class got for a test in our hypothetical class of size 5.

```
   grades[0]    grades[1]    grades[2]    grades[3]    grades[4]
+------------+------------+------------+------------+------------+
|    92.5    |    52.4    |    75.0    |    82.0    |    88.9    |
+------------+------------+------------+------------+------------+
```

This is a common representation of an array, a one-dimensional grid with a specific size. Since our array should have 5 grades, we have 5 separate cells we can put our data in.

But how do we do this in C?!

## Creating Arrays
To create an array, we need to specify the datatype, a variable name, and the size of the array:

```c
float grades[5];
```
Here, we just created an array called "grades" of size 5 with a datatype of `float`, meaning each element in this array should be a `float`.

A generic form of creating arrays looks like this:
```
<datatype> <variablename>[<size>];
```

So, using this format, we can also have different types:

```c
int pineapples[10];     // integer array of size 10
double coordinates[4];  // double array of size 4
char word[4];           // char array of size 4 - also a string, sneak peak!
```

However, in our previous example, we only created the _skeleton_ that can hold our grades, but we haven't actually put anything in it. Our array is currently empty. So, how do we put our grades into our array?

## Populating our Array
Currently, our array (essentially) looks like this:

```
   grades[0]    grades[1]    grades[2]    grades[3]    grades[4]
+------------+------------+------------+------------+------------+
|            |            |            |            |            |
+------------+------------+------------+------------+------------+
```

It's empty* and barren. Let's put some grades into it!

_*Technically, when we instantiate an array like this, our array isn't really empty. Instead,
it's filled with garbage values. We will learn more about this later, but it is important
to know, since accessing these array values when we have garbage values still in them may give unintended behavior._

To access each cell in an array, we have to know what _index_ we want to access first. 
You may have noticed that on top of each cell, we have a number next to the array name (for instance, `grades[0]`). This represents the index of each cell in our grades array.
The index represents the location of a cell in an array. An important thing to note about C (and many other programming languages) is that array indexes start at **0**.

What does this mean? Well, if we wanted the index of the first cell, we wouldn't use 1. Instead, we would use 0 to represent the first cell in an array. This also means that if we wanted to access the last cell in an array, we would use `n - 1`, `n` being the size of the array. For instance, in our `grades` array of size 5, if we wanted to access the last element, we would use index 4, since we start from 0 for our indexes.

To access an index in an array, we can use brackets (`[]`).
Here, let's access the first cell of `grades`, and assign the first cell to `92.5`:

```c
grades[0] = 92.5; // first cell of the grades array will have an index of 0
```

Great! Now we have one grade in... but what about the rest?
Our array currently looks like this now:

```
   grades[0]    grades[1]    grades[2]    grades[3]    grades[4]
+------------+------------+------------+------------+------------+
|    92.5    |            |            |            |            |
+------------+------------+------------+------------+------------+
```

We've populated the first cell with a grade, by using our array access operator. We can do this for the rest of the grades as well:

```c
grades[0] = 92.5;
grades[1] = 52.4;
grades[2] = 75.0;
grades[3] = 82.0;
grades[4] = 88.9; // this is the last element we can access in our grades array!
```

Here is what our array looks like now:

```
   grades[0]    grades[1]    grades[2]    grades[3]    grades[4]
+------------+------------+------------+------------+------------+
|    92.5    |    52.4    |    75.0    |    82.0    |    88.9    |
+------------+------------+------------+------------+------------+
```

You can also overwrite the values in an array by using the array access operator:
```c
grades[3] = 23.0 // they failed...
```

Here's a preview of the array after overwriting what's in index 3 of `grades`:
```
   grades[0]    grades[1]    grades[2]    grades[3]    grades[4]
+------------+------------+------------+------------+------------+
|    92.5    |    52.4    |    75.0    |    23.0    |    88.9    |
+------------+------------+------------+------------+------------+
```

Now we finally have our array full of grades! Obviously, this is a pretty tedious way to populate our array; we just manually typed out the grades for each student! However, there are other ways in which we can initialize and populate an array:

## Other Ways to Create and Populate an Array

### Initializer List
If we already know what will be in our array, we can create an array like this, using what is called an initializer list:
```c
int favorite_numbers[] = {3, 5, 9, 42, 1, 3141592};
```
Notice how we didn't need to specify the size of the array. This is because we used curly brackets (`{}`) to 'initialize' our array inline, so C will automagically create our array with the smallest size needed to house all of our elements. We can verify this by using `sizeof`:

<details>
<summary>Show code</summary>

```c
#include <stdio.h>
int main(void) {
    // array of integers, with 6 numbers inside of it:
	int favorite_numbers[] = {3, 5, 9, 42, 1, 3141592};
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

Neat tech! Of course, we can still put the size if we wanted, but **be careful** not to overstep the bounds of the array:
```c
// array created with initializer list
float grades[5] = {92.5, 52.4, 75.0, 82.0, 88.9};

// *** DON'T DO THIS! We're overstepping our bounds! ***
int numbers[3] = {1, 2, 3, 4, 5}; // array of size 3 with 5 elements?! uh oh...
```

### Loops
We can also use loops to initialize our array, such as a for loop. Can you guess what our array will look like after running this code?

```c
int nums[5];
for (int i = 0; i < 5; i++) {
    nums[i] = i*2;
}
```
<details>
<summary>Reveal answer</summary>

```
   	nums[0]    	 nums[1]      nums[2]      nums[3]      nums[4]
+------------+------------+------------+------------+------------+
|    92.5    |    52.4    |    75.0    |    82.0    |    88.9    |
+------------+------------+------------+------------+------------+
```

</details>

Let's break down what the array parts of our code does.

```c
int nums[5];
```
We create an array of integers, with a size of 5. Currently, it is empty.

```c
nums[i] = i*2;
```
Using our counter variable, i, we access the element in our array at index i.
Then, we use the assignment operator to set this element equal to what the counter variable is currently, multiplied by 2.
So, for instance, if i = 3, our loop would essentially be doing this:

```c
nums[3] = 3*2;
```
Thus, the element at `nums[3]` would be set to 6.
Since this loop runs from 0 to 4, then we will apply this "formula" for each cell in the array.

## Being Careful With Arrays
Arrays are powerful. However, this also means that if you aren't careful,
you can really mess things up!

### Out of Bounds
One common mistake one might make is forgetting that arrays in C start at 0, and end at `n - 1`,
n being the size of the array. If you declare an array with the following statement:

```c
int arr[5] = {10, 20, 30, 40, 50};
```

Remember that to access the first element, in this case 10, we would use `arr[0]`. To access the last element,
we would need to know how large the array is, and subtract 1 from that number. We declared the array with a size of 5,
so to access the last element in the array, we would use `arr[4]`, which in this case holds 50.

It is **extremely** important to be aware of the sizes of your arrays. If you have an array of size 5, and try accessing
what is in index 5, (e.g. `arr[5]`) C will let you do this! However, this may cause unintended behavior, and at this point,
we're crossing into dangerous territory.

```
	arr[0]    	 arr[1]       arr[2]       arr[3]       arr[4]
+------------+------------+------------+------------+------------+
|     10     |     20     |     30     |     40     |     50     |     *?*&!(
+------------+------------+------------+------------+------------+
																		 ^
```

Because we accidentally accessed the array element at index 5, we get garbage data! This could even be parts of memory
that the program is not supposed to be able to access.

Here's an example program to show what can happen if you access
far beyond the limits of what you defined your array to be:

<details>
<summary>Show code and output</summary>

```c
#include <stdio.h>

int main(void) {
    // define an integer array of size 5, and assign numbers
    int numbers[5] = {7, 14, 2, 3, 4};
    // try accessing the 25th index of our numbers array
    // ...which doesn't make sense, since our array has a size of 5!
    numbers[25] = 20;

	// try printing every single element
	for (int i = 0; i <= 25; i++) {
		// print a warning when i is greater than the last index of our array
		if (i == 5)
			printf("\nwarning: entering uncharted territory!\n");
		// print the number located in the i-th index of numbers
        printf("numbers[%d]: %d\n", i, numbers[i]);
	}
	return 0;
}
```

```
$ ./a.out
numbers[0]: 7
numbers[1]: 14
numbers[2]: 2
numbers[3]: 3
numbers[4]: 4

warning: entering uncharted territory!
numbers[5]: 0
numbers[6]: -1575731456
numbers[7]: -1231441846
numbers[8]: 1
numbers[9]: 0
numbers[10]: -1815982704
numbers[11]: 32633
numbers[12]: 0
numbers[13]: 0
numbers[14]: 1721135497
numbers[15]: 21954
numbers[16]: -301701456
numbers[17]: 1
numbers[18]: -301701432
numbers[19]: 32766
numbers[20]: 0
numbers[21]: 0
numbers[22]: -710817234
numbers[23]: 711796881
numbers[24]: -301701432
numbers[25]: 20
```

</details>

By the time our index is 5 in our loop, we start getting some wacky numbers. We are accessing garbage values at this point,
and the program is unsafe. This is extremely dangerous,
at this point we have abandoned our trajectory and are reaching beyond the known limits of the universe,
where physics starts breaking down, etc.

### Variable Length Arrays (VLAs)

Let's say you want to create an array, but you don't know what
size it will be at runtime. At this point, you may not know about using `malloc` to create arrays, so you may think, "What if I just ask the user how big they want the array to be?"

```c
int n;
printf("how many numbers?\n");
scanf("%d", &n);
int nums[n];
```

This is bad practice. Without getting into too much detail,
currently, when creating an array the traditional way (using brackets), we are creating an array in the stack space, which has limited memory. If the user enters an incredibly large number when we are using VLAs:

``` {.terminal}
$ ./a.out
how many numbers?
10000000000000000000
Segmentation fault
```

We get a segmentation fault. We just allowed the user to crash the program, since we allowed them to overflow the stack memory. This is why, most of the time, if we do not know how large our array will be at runtime, we want to use `malloc`, or any other related memory allocation function, since we can have much more space, and also catch these errors in case the user wants to try pulling anything sneaky like this.

### "Empty" Arrays and Garbage Values
All the way back up, we had a visualization an "empty" array. Here's another example, using
`nums` as a variable instead:
```
    nums[0]      nums[1]      nums[2]      nums[3]      nums[4]
+------------+------------+------------+------------+------------+
|            |            |            |            |            |
+------------+------------+------------+------------+------------+
```
However, in reality, if we created an array (for instance, using `int nums[5]`), our array
actually looks more like this:
```
    nums[0]      nums[1]      nums[2]      nums[3]      nums[4]
+------------+------------+------------+------------+------------+
|   ^&*%$*   |   *&%$%(   |   &*#$^{   |   *&^$#%   |   &*%$^*   |
+------------+------------+------------+------------+------------+
```
What we're representing here is how, when creating an array with seemingly "nothing" in it (such as only writing `int nums[5]`), our array is actually initialized with garbage values. We can actually see this with our own eyes if we just print the array before we actually put any values in it!

<details>
<summary>Show code and output</summary>

```c
#include <stdio.h>

int main(void) {
	int nums[5];
	for (int i = 0; i < 5; i++) {
		printf("nums[%d]: %d\n", i, nums[i]);
	}

	return 0;
}
```

```
$ ./a.out 
nums[0]: -1041127463
nums[1]: 32766
nums[2]: 100
nums[3]: 0
nums[4]: 4096
```

</details>

More wacky numbers! This is why it's important to make sure you properly initialize your array
after creating it. You may also look into using `calloc` to initialize your arrays with zeroes.