---
title: Switch Statements
author: Matthew Gibbons
---

Here is some additional practice with switch statements. 

@. You're a time traveler with a computer, but it happens to have very limited capabilities thanks to the Time Police. You also happen to be a history buff that loves the Roman Empire, so you traveled back in time with your silly little programable computer to the silly little Roman Empire. You've decided to teach the Romans modern arabic numbers rather than their weird letter numbers. To expidite the teaching process, you want to make a program that can convert modern integers into Roman numerals up to 10. Write a program that uses a switch statement to convert integers up to 10 into Roman numerals. Hint: Remember, the Romans didn't have a number for 0, and they would probably like to be prompted for an input. You would also like the program to stay running rather than restarting for every input. The Time Police Limited Computer (TTPLC) only allows one program to be run a month. Thanks, Time Police. 



@. You have returned from your time traveling adventure and are back to working your \[generic service job\]. The Romans appreciated the number system lesson, but they promptly dropped it because it only went up to 10. Time paradox avoided. 

	There has been a recent problem with mobile orders. You decided to take a look at the mobile order system to locate the issue. You located where orders are differentiated in the code. You have the menu for reference. Is there an issue in the code? If there is, what is it?

	``` {.c .numberLines}
	/*
	+-------------------------------------------+
	|          1. Chicken Sandwich              |
	|     2. Cheddar Broccoli Bread Bowl        |
	| 3. Ham Egg and Cheese Breakfast Burrito   |
	|         4. Vegan Crunch Wrap              |
	| 5. Bacon Egg and Salsa Breakfast Bagel    |
	|       6. Turkey Super Sandwich            |
	|            7. Avocado Toast               |
	|   8. Cheddar Bacon Ham Croissantwich      |
	+-------------------------------------------+
	*/

	...

	switch(order)
	{
		case 1:
			total = total + 4.50;
			break;
		case 2:
			total = total + 5.00;
			break;
		case 3:
			total = total + 3.79;
			break;
		case 4:
			total = total + 3.00;
			break;
		case 5:
			total = total + 4.00;
		case 6:
			total = total + 7.85;
			break;
		case 7:
			total = total + 4.29;
			break;
		case 8:
			total = total + 3.35;
	}

	...
	```



@. switch all over this place



@. nested switches.