---
title: Enums
author: Matthew Gibbons
---

## Intro to Enums

`enum` is the keyword for the enumerator data type in C, which is a user defined data type. It is used to assign names to integer constants to make for improved readability and easy maintenance. The basic syntax is as follows:

``` c
enum name {Const1, Const2, Const3,... ConstN};
```

If no values are assigned, `Const1` will be assigned 0, `Const2` will be assigned 1, and so on. However, these values can be easily changed. It should also be noted that `name` is optional, and unnamed enumerators will not break your code.

There are some naming conventions to keep in mind while working with enums. Enum constants are either capitalized or in all caps. Name tags are lowercase.

## Enum Valuation and Adjustment

A common example is an enumeration of the days of the week, which may look like this:

``` c
enum days_of_the_week {Sunday = 1, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday};
```

This assigns `Sunday` the value of 1, and the following value will be 1 greater. In this example, the compiler assigns value to the constants based on the defined value in the form previous + 1. You can define any number of values in an enumerated list and this rule will be followed. For example, we can define the value for each enumerated constant if we choose like this:

``` c
enum game_difficulty {Cookie_Clicker = 1, Gungeon = 6, ARK = 7, Dark_Souls = 10};
```

or we can define some of them like this:

``` c
enum exp_value {Wheat = 2, Onion, Carrot, Corn = 7, Potatoes, Strawberries = 11};
```

In this case, the assigned values would look like this:

```
Wheat = 2
Onion = 3
Carrot = 4
Corn = 7
Potatoes = 8
Strawberries = 11
```

This is in line with the "previous + 1" rule stated earlier. `Onion`, `Carrot`, and `Potatoes` will all follow this rule because they were not explicitly defined.

Values in the same list can have the same values. If we look back at our `game_difficulty` example, we can add a few more titles that have equivalent difficulty.

``` c
enum game_difficulty {Cookie_Clicker = 1, Gungeon = 6, ARK = 7, Dark_Souls = 10, Super_Meat_Boy = 10, House_Flipper = 1, Bloodborne = 10};
```

As you can see, Dark Souls, Bloodborne, and Super Meat Boy are all rated at the same level of difficulty, as well as House Flipper and Cookie Clicker. These will not cause any errors, they just happen to hold the same value, as if they were any regular `int` variable.

## Using Enums in Code

When using enums, we must define a variable type. This can be done in one of two ways. Here is a general example:

```c
enum enum_name {Const1, Const2, Const3, ..., ConstN};
enum enum_name variable_name;

// or

enum enum_name {Const1, Const2, Const3, ..., ConstN} variable_name;
```

We can even define multiple variables of type `enum_name` like this:

```c
enum enum_name {Const1, Const2, Const3, ..., ConstN} different_variable_name;
enum enum_name variable_name, another_one;

// or

enum enum_name {Const1, Const2, Const3, ..., ConstN} different_variable_name, variable_name, another_one;
```

**Note:** Splitting the variable type up looks a bit strange. This is only done for the sake of example. The second option is a nicer and cleaner.


Now we can assign and use our enumerated values in code. Lets look at something simple using the `exp_value` example.

``` c
#include <stdio.h>

enum exp_value {Wheat = 2, Onion, Carrot, Corn = 7, Potatoes, Strawberries = 11} crops, plants, dirt_growers;

int main(void)
{
	crops = Onion;
	plants = Corn;
	dirt_growers = Potatoes;
	printf("Onion Experience Gain: %d\n", crops);
	printf("Corn Experience Gain: %d\n", plants);
	printf("Potatoes Experience Gain: %d\n", dirt_growers);
	return 0;
}
```

Here we assign the value of `Onion` to `crops`, which we know is 3. The expected output would be as follows:

```
Onion Experience Gain: 3
Corn Experience Gain: 7
Potatoes Experience Gain: 8
```

But what if we don't want to use the enum keyword explicitly?

### Using `typedef` With Enums

We can use the `typedef` keyword to make our enumerated list a bit more versatile. For example, we will be able to create an enum variable, rather than being restricted to the constants in the enumerated list. Let's look at this example.

``` c
#include <stdio.h>

typedef enum exp_value {Wheat = 2, Onion, Carrot, Corn = 7, Potatoes, Strawberries = 11} crop_experience;

int main(void)
{
	int x = 9;
	crop_experience Mystery_crop = x;

	switch(Mystery_crop)
	{
		case Wheat:
			printf("It is wheat.\n");
			break;
		case Onion:
		...
		default:
			printf("You have found a new crop. You gained %d experience.\n", Mystery_crop);
			break;
	}
	return 0;
}
```

In this case `x = 9` is hard coded, but you could also take in an input and check if it is a crop you've encountered before.

## Enum Errors

Enumerated constants can only appear in one enumerated list. For example, this code would produce a `replication of enumerator` error:

``` c
#include <stdio.h>

enum days_of_the_week {sun = 1, mon, tues, wed, thur, fri, sat} day;
enum celsetial_bodies {sun, moon, jupiter} body;

int main(void)
{
	day = mon;
	printf("%d\n", mon);
	body = sun;
	printf("%d\n", sun);
	return 0;
}
```

In this case, `sun` appears in two enumerated lists, thus the error. You will also get an error if you use non-integer values.