---
title: Enums
author: Matthew Gibbons
---

## Intro to Enums

`enum` is the keyword for enumeration in C, which is a user defined data type. It is used to assign names to integer constants to make for improved readability and easy maintenance. The basic syntax is as follows:

``` c
enum name {const1, const2, const3,... constN};
```

If no values are assigned, `const1` will be assigned 0, `const2` will be assigned 1, and so on. However, these values can be easily changed.

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
enum exp_value {wheat = 2, onion, carrot, corn = 7, potatoes, strawberries = 11}
```

In this case, the assigned values would look like this:

```
wheat = 2
onion = 3
carrot = 4
corn = 7
potatoes = 8
strawberries = 11
```

This is in line with the "previous + 1" rule stated earlier. `onion`, `carrot`, and `potatoes` will all follow this rule because they were not explicitly defined.

## Errors and Reused Values

Enumerated constants can only appear in one enumerated list. For example, this code would produce a `replication of enumerator` error:

``` c
#include <stdio.h>

enum days_of_the_week {sun = 1, mon, tues, wed = 5, thur, fri, sat} day;
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

Separately, values in the same list can have the same values. If we look back at our `game_dificulty` example, we can add a few more titles that have equivalent difficulty.

``` c
enum game_difficulty {Cookie_Clicker = 1, Gungeon = 6, ARK = 7, Dark_Souls = 10, Super_Meat_Boy = 10, House_Flipper = 1, Bloodborne = 10};
```

As you can see, Dark Souls, Bloodborne, and Super Meat Boy are all rated at the same level of difficulty, as well as House Flipper and Cookie Clicker. These will not cause any errors, they just happen to hold the same value, as if they were any regular `int` variable.