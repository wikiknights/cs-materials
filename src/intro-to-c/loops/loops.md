---
title: Loops
author: Matthew Gibbons
---

## Intro to Loops

<!-- **TODO:** Infinite loops, one-line for loops, nested loops. -->

All good roller coasters have loops. Unlike roller coasters, not all good programs have loops. However, programs that have repeated code have loops instead, and that makes them good. In C, there are three kinds of loops we can use: for loops, while loops, and do while loops. We use loops to rerun some lines of code based on a condition.

### While Loops

While loop syntax looks like this:

``` c
while(condition)
{
	//code to execute
}
```

As long as the condition is true, the loop will continue to run. Any nonzero integer is true in C.

An example of a while loop would look something like this:

``` c
int x = 15;

while(x >= 5)
{
	printf("X is %d.\n", &x);
	x--;
}

printf("I'm free of this loop.");
```

This loop would print give us this:

```
X is 15.
X is 14.
X is 13.
X is 12.
...
X is 6.
X is 5.
I'm free of this loop.
```

5 is included because of the condition being a `>=` comparison. You may also notice the decrement of `x`. While loops are easy to make into infinite loops. Without the decrementing `x`, this loop would be infinite because the condition would never become false.

A quick example of this, using the nonzero-is-true property of C, could be something like this:

``` c
x = 1;

while(0 - x)
{
	printf("Oh no.\n");
	x++;
}
```

`0 - x` will only become more negative and never reach zero (neglecting integer overflow) and thus it will be an infinite loop. We could just as easily remove the `x++` to do the same thing, and then not even integer overflow could save us.

All loops can have multiple lines of code in them, these ones have just been easy examples. They can also have multiple conditions if you use logical operators.

``` c
while(control == 1 || control == 3)
{
	if(control == 1)
		//move forward
	else
		//move backwards
	scanf("%d", control);
}
```

### Do While Loops

Do While loops are used when there is some amount of code you want to execute before the while loop checks the condition. Do whiles check the condition at the end of the loop, rather than at the beginning. It would be similar to a friend holding a small pebble thinking it was a peanut, and claiming that it was before trying to eat it.

That as a do while might look something like this:

``` c
int peanut = 1;
int rock = 0;
int x = rock;

do
{
	printf("This is a peanut.\n");
}while(x != rock)

printf("It was a rock.\n")
```

This do while will print `This is a peanut.` one time, because we know the peanut is a rock. What if we didn't know? What if he had a back of peanut shaped rocks and peanuts and grabbed one at random? Then we might get a loop that executes more than once, until they find a rock.

``` c
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(void)
{
	int peanut = 1
	int rock = 0

	srand(time(NULL));
	int mystery_snack = rand() % 1;

	do
	{
		printf("This is a peanut.\n");
	}while(x != rock)

	printf("It was a rock.\n")
	return 0;
}
```

This is a very confident friend, as they always claim peanut and then accept the consequences.

### For Loops

For loops initialize a variable, check a condition, and increment (or decrement) in their declaration, separated by semicolons. It would look something like this:

``` c
for(int x = 0; x < 25; x++)
{
	printf("The loop has run %d times.\n", &x + 1);
	printf("X is currently %d.", &x);
}
```

`int x = 0` is the initialization, `x < 25` is the condition, and `x++` is the increment. The first time this loop runs, `x` will be 0 and will increment at the end of the loop.

For loops have some weird things you can do with them.