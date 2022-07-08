---
Title: Switch Statements
author: Matthew Gibbons
---

Here is some additional practice with switch statements. 

@. You're a time traveler with a computer, but it happens to have very limited capabilities thanks to the time police. You also happen to be a history buff that loves the Roman Empire, so you traveled back in time with your silly little programable computer to the silly little Roman Empire. You've decided to teach the Romans modern arabic numbers rather than their weird letter numbers. To expidite the teaching process, you want to make a program that can convert modern integers into Roman numerals up to 10. Write a program that uses a switch statement to convert integers up to 10 into Roman numerals. Hint: Remember, the Romans didn't have a number for 0, and they would probably like to be prompted for an input. You would also like the computer to stay on rather than restarting. One of the limits of you computer is profound startup times. Thanks, time police. 

**Answer:**

``` c
#include <stdio.h>

int main(void)
{
	int number;

	do printf("Press 111 to exit.");
	while(number != 111)
	{
		printf("What number would you like to conver?");
		scanf("%d", &number);
		
		switch(number)
		{
			case 1:
				printf("%d as a Roman numeral would be I.", number);
				break;
			case 2:
				printf("%d as a Roman numeral would be II.", number);
				break;
			case 3:
				printf("%d as a Roman numeral would be III.", number);
				break;
			case 4:
				printf("%d as a Roman numeral would be VI.", number);
				break;
			case 5:
				printf("%d as a Roman numeral would be V.", number);
				break;
			case 6:
				printf("%d as a Roman numeral would be VI.", number);
				break;
			case 7:
				printf("%d as a Roman numeral would be VII.", number);
				break;
			case 8:
				printf("%d as a Roman numeral would be VIII.", number);
				break;
			case 9:
				printf("%d as a Roman numeral would be IX.", number);
				break;
			case 10:
				printf("%d as a Roman numeral would be X.", number);
				break;
			case 111:
				return 0;
			default:
				printf("That was not a valid entry. Try again with a number between 1 and 10, or the exit value.");
				break;
		}
	}
}

```

@. You have returned from your time traveling adventure and are back to working your generic service job. The Romans appreciated the number system lesson, but they promptly dropped it because it only went up to 10. Time paradox avoided. 

There has been a recent problem with mobile orders. You decided to take a look at the mobile order system to locate the issue. You located where orders are differentiated in the code. Is there an issue in the code? If there is, what is it?

``` c
switch(order)
{
	case "Chicken Sandwich":
		total = total + 4.50;
		break;
	case "Cheddar Broccoli Bread Bowl":
		total = total + 5.00;
		break;
	case "Ham Egg and Cheese Breakfast Burrito":
		total = total + 3.79;
		break;
	case "Vegan Crunch Wrap":
		total = total + 3.00;
		break;
	case "Bacon Egg and Salsa Breakfast Bagel":
		total = total + 4.00;
	case "Turkey Super Sandwich":
		total = total + 7.85;
		break;
	case "Avocado Toast":
		total = total + 4.29;
		break;
	case "Cheddar Bacon Ham Croissantwich":
		total = total + 3.35;
}
```

**Answer:** Yes. The switch case on line 87 does not have a `break` in it.