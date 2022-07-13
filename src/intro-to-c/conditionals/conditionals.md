---
title: Conditional Statements
author: Matthew Gibbons
---

## The Basics of Conditionals

---

What if you want something to happen, but only if it meets specific requirements? For example, if it is sunny then I will close the blinds. In this example, the "something to happen" is closing the blinds, and the requirement, or condition, is it being sunny. Another way to say this would be if it is true that it is sunny, then I will close the blinds. This is the basis of conditionals. If something is true (or false), then something will occur. For this, we use logical operators.

In C, false is defined as zero and true is defined as all other non-zero values. C does not have true and false reserved as keywords. This means we compare a condition with false using 0. To compare a condition with true, we can use **any non-zero value**, like negative integers and positive and negative floats, but most commonly we use 1.

## If: The Big Question

---

If statements are the first step to conditionals. In fact, the previous example can be expressed in the format of an if statement. First, the basic structure of an if statement.

``` c
if(boolean expression)
{
	// code to executed
}
```
Applying this to our sunny blinds example, we have this:

``` c
if(sunny == 1)
{
	close_the_blinds();
}
```

In this example, `sunny` is being compared to true. If it is sunny, then the condition will be met, and we will execute `close_the_blinds()`. If it is not sunny (`sunny = 0`), then the condition statement would essentially be `0 == 1`, which we know is false. This would mean that `close_the_blinds()` would not be executed.

It is important to note that you can put more than one conditional statement in the `if` statement, but we'll explore this more in a later section.

## Else: The Alternative

---

`else` is the jelly to the `if` peanut butter. Not required, but it makes it better. So, to jelly up our example, if it is sunny then I will close the blinds. Otherwise, it is \[raining, cloudy, chance of meatballs, snowy, dark\] and the blinds will be open. `else` is a catch-all for things that make the condition false. The basic structure would look something like this:

``` c
if(boolean)
{
	// code to execute
}
else
{
	// code to execute
}
```
With our example it would look like this:

``` c
if(sunny == 1)
{
	close_the_blinds();
}
else
{
	keep_the_blinds_open();
}
```
It is important to note that your program will not compile if you use `else` without `if`. `if` is required to use `else`, but not vice versa.

## Else If: The Big Alternative Question

---

`else if` is the bread that completes the if-else relationship. With bread, we can now make a quadruple-decker PBJ if we so choose. Now, rather than a catch-all with `else`, we can be specific about what happens if our first condition fails. Let's look at the basic structure of an `else if`.

``` c
if(boolean expression)
{
	// code to execute
}
else if(boolean expression)
{
	// code to execute
}
```

We're going to adjust our blinds example a bit to introduce multiple conditions. This time I will close the blinds if it is sunny or if it is dark. I will keep them open if it is snowing or raining. Otherwise, I will go on a drive. That would look something like this:

``` c
if(sunny == 1)
{
	close_the_blinds();
}
else if(dark == 1)
{
	close_the_blinds();
}
else if(snowy == 1)
{
	keep_the_blinds_open();
}
else if(rainy == 1)
{
	keep_the_blinds_open();
}
else
{
	go_for_a_drive();
}
```

With `else if`, we can now control multiple scenarios with differing outcomes, and we can follow it up with an `else` to catch the other conditions we didn't explicitly check for.

## The Ternary Operator: The Rule of Three

---

The ternary operator is named so because it takes three operands.  It is similar to an `if else` in that it takes in a condition statement and then has an outcome for true and false. Looking at the structure will help.

``` c
condition ? expression_if_true : expression_if_false;
```

This is a rewrite of this equivalent `if-else` statement:

``` c
if(condition)
{
	expression_if_true;
}
else
{
	expression_if_false;
}
```

Lets first look at it with our blinds example:

``` c
#include <stdio.h>

int main(void)
{
	int sunny = is_it_sunny();

	(sunny == 1) ? close_the_blinds() : keep_the_blinds_open();

	return 0;
}
```

Here is a different example with a condition that compares two integers:

``` c
#include <stdio.h>

int main(void)
{
	int num1 = 20, num2 = 23;

	(num1 > num2) ? printf("%d is greater than %d.\n", num1, num2) : printf("%d is greater than %d.\n", num2, num1);

	return 0;
}
```

In this example, `num1` is not greater than `num2`, so the output would be as follows:

```
23 is greater than 20.
```

## Multi-condition Statements

---

`if` statements and the ternary operator can actually handle multiple comparisons or conditions. Looking back at the example in the `else if` section, it can be more efficiently rewritten like this:

``` c
#include <stdio.h>

int main(void)
{
	if(sunny == 1 || dark == 1)
	{
		close_the_blinds();
	}
	else if(snowy == 1 || rainy == 1)
	{
		keep_the_blinds_open();
	}
	else
	{
		go_for_a_drive();
	}
	return 0;
}
```

Let's try it with the ternary operator.

``` c
#include <stdio.h>

int main(void)
{
	int m = 20, n = 15, g = 17, p = 3;

	(m > n && m > g && m > p) ? printf("%d is the greatest.\n", m) : printf("%d is not the greatest.\n", m);

return 0;
}
```

In this example, the output would be as follows:

```
20 is the greatest.
```

Order doesn't technically matter, but the best practice is to order them in a way that allows for potential short circuiting.

## Short Circuiting

---

When writing conditional statements, it is good practice to write them in a way that allows for the compiler to skip the evaluation of further conditions when possible. This skip by the compiler is called short circuiting. Short circuiting is possible when evaluating logical `and` and logical `or`. For example, if the left side of a logical `and` is false, the whole expression will be false regardless of the right side of the expression, so the compiler skips this evaluation. Here is an example of such a case:

``` c
#include <stdio.h>

int main(void)
{
	int x = 1, y = 2, z = 2;

	if(x == y && y == z)
	{
		printf("Everything is the same!\n");
	}
	else
	{
		printf("Everything is NOT the same!\n");
	}
	return 0;
}
```

`x` and `y` are not equivalent, so the comparison would resolve to false, rendering the whole statement false.

With a slight change, here is a similar example for a logical `or` short circuit:

``` c
#include <stdio.h>

int main(void)
{
	int x = 1, y = 2, z = 2;

	if(y == z || x == y)
	{
		printf("Something is the same!\n");
	}
	else
	{
		printf("Nothing is the same!\n");
	}
	return 0;
}
```

Note that logical `or` will resolved if **either** side of the expression is true, so comparing `y` and `z` will resolve to true, rendering the whole statement true. Since `y == z` is true, `x` and `y` don't even need to be compared. The result of `x == y` would have no effect on the truthiness of the logical expression.

Here is a small program that will help in visualizing the short circuit. Feel free to copy this and plug it into a compiler!

``` c
#include <stdio.h>

int main(void)
{
	int x = 1, y = 2, z = 2;

	if(y == z || x++)
	{
		printf("Something is the same!\n");
	}
	else
	{
		printf("Nothing is the same!\n");
	}
	printf("x = %d\n", x);
	return 0;
}
```

When you run this program, the output will show that `x = 1`, even though it was (supposedly) incremented in the if statement. This part of the code was actually never executed due to the short circuit, so `x` was never incremented. If you switch the conditions around, you will get different behavior from this program, even though it will still short circuit. This code can also be slightly manipulated to show the short circuiting of the logical `and` as well, but I will leave that for you to try.

<!--- TODO: One line if statements --->
## One-Line If and Else Statements

---

As programmers, saving keystrokes makes us feel fancy and smart. Two places we can do this is in one-line `if` and `else` statements. By one-line, I specifically mean the code executed by the `if` or `else` statement, not the condition statement. I will use the previous example to demonstrate, just adjusted a little.

``` c
if(y == z || x++)
	printf("Something is the same!\n");
else
	printf("Nothing is the same!\n");
```

This comes in handy when dealing with many short conditionals. However, there is an important pitfall to be aware of. C will only recognize the next following executable line as within the `if` statement. That is, even if you put twenty new lines between `if` and `printf("Something is the same!\n");`, "Something is the same!" will still only be executed if the condition is true. If you did something like this, though, your compiler will be unhappy:

``` c
if(y == z || x++)
	printf("Something is the same!\n");
	printf("Hooray!\n");
else
	printf("Nothing is the same!\n");
```

The second `printf` would not be executed as part of the `if`, but instead be interpreted as a new line of code outside of the `if`, effectively separating the `if` and `else`, causing a compilation error. The error would be an "`else` without previous `if`" error. To resolve this error, curly brackets can be placed around both the print statements like this:

``` c
if(y == z || x++)
{
	printf("Something is the same!\n");
	printf("Hooray!\n");
}
else
	printf("Nothing is the same!\n");
```

The `else` still being only one line would not require curly brackets, but you may add them if it is more pleasing to the eye.