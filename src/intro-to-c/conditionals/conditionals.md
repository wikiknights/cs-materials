---
title: Conditionals
author: Matthew Gibbons
---

<!--TODO: ELSE IF, TERNIERY OPERATOR. NOTE: SHORT CIRCUITING, MULTI-CONDITION CONDITIONALS-->

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

In this example, sunny is being compared to true. If it is sunny, then the condition will be met, and we will execute `close_the_blinds()`. If it is not sunny (`sunny = 0`), then the condition statement would essentially be `0 == 1`, which we know is false. This would mean that `close_the_blinds()` would not be executed.

It is important to note that you can put more than one conditional statement in the `if` statement, but we'll explore this more in a later section.

## Else: The Alternative

---

`else` is the jelly to the `if` peanut butter. Not required, but it makes it better. So, to jelly up our example, if it is sunny then I will close the blinds. Otherwise, it its \[raining, cloudy, chance of meatballs, snowy, dark\] and the blinds will be open. `else` is a catch-all for things that make the condition false. The basic structure would look something like this:

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
```

With `else if`, we can now control multiple scenarios with differing outcomes, and we can follow it up with an `else` to catch the other conditions we didn't explicitly check for.

## The Ternary Operator: The Rule of Three

---

