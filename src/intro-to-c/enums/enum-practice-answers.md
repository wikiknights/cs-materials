---
title: Enums
author: Matthew Gibbons
---

@. You are a half decent farmer in a video game that received a handful of seeds in the mail. With them came a note that informed you they all take the same amount of time to grow. You decided to plant them all and nurture them to maturity. The day has come to harvest, and you need to keep track of the crops you recognize. Write a program that will keep a count of each crop you have harvested, including unknowns, and print the number harvested in order of experience gain (least to greatest). Unknown crops can be last on the list. Below are code snippets so an answer key can exist.

``` c
// Random seed
srand(24164132);
// Random number generated
1 + rand() % 13;
// Crop Values
3, 5, 6, 9, 11, 12;
```

**Answer:**

``` c
#include <stdio.h>
#include <stdlib.h>

typedef enum exp_value {Wheat = 5, Onion, Carrot = 3, Corn = 9, Potatoes = 12, Strawberries = 11} crop;

int main(void)
{
	srand(24164132);
	int wheatCounter = 0, onionCounter = 0, carrotCounter = 0, cornCounter = 0, potatoesCounter = 0, strawberriesCounter = 0, newCounter = 0;
	for(int i = 0; i < 100; i++)
	{
		crop Mystery_crop = 1 + rand() % 13;
		switch(Mystery_crop)
		{
			case Wheat:
				wheatCounter++;
				break;
			case Onion:
				onionCounter++;
				break;
			case Carrot:
				carrotCounter++;
				break;
			case Corn:
				cornCounter++;
				break;
			case Potatoes:
				potatoesCounter++;
				break;
			case Strawberries:
				strawberriesCounter++;
				break;
			default:
				printf("You have found a new crop. You gained %d experience.\n", Mystery_crop);
				newCounter++;
				break;
		}
	}
	printf("Carrot harvested: %d\n", carrotCounter);
	printf("Wheat harvested: %d\n", wheatCounter);
	printf("Onion harvested: %d\n", onionCounter);
	printf("Corn harvested: %d\n", cornCounter);
	printf("Strawberries harvested: %d\n", strawberriesCounter);
	printf("Potatoes harvested: %d\n", potatoesCounter);
	printf("New crops harvested: %d\n", newCounter);

	return 0;
}
```

**Output:**
```
Carrot harvested: 9
Wheat harvested: 6
Onion harvested: 7
Corn harvested: 6
Strawberries harvested: 6
Potatoes harvested: 11
New crops harvested: 55
```

**Note:** It does not matter what you named the crops, it only matters that you get the correct output and use typedef with enums.
