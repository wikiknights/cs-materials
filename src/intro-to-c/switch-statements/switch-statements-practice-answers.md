---
title: Switch Statements (Solutions)
author: Matthew Gibbons
---

Here is some additional practice with switch statements. 

@. You're a time traveler with a computer, but it happens to have very limited capabilities thanks to the Time Police. You also happen to be a history buff that loves the Roman Empire, so you traveled back in time with your silly little programable computer to the silly little Roman Empire. You've decided to teach the Romans modern arabic numbers rather than their weird letter numbers. To expidite the teaching process, you want to make a program that can convert modern integers into Roman numerals up to 10. Write a program that uses a switch statement to convert integers up to 10 into Roman numerals. Hint: Remember, the Romans didn't have a number for 0, and they would probably like to be prompted for an input. You would also like the program to stay running rather than restarting for every input. The Time Police Limited Computer (TTPLC) only allows one program to be run a month. Thanks, Time Police. 

	**Answer:**

	``` c
	#include <stdio.h>

	int main(void)
	{
		int number;

		do 
		{
			printf("Press 111 to exit.\n");
			printf("What number would you like to convert?\n");
			scanf("%d", &number);
			
			switch(number)
			{
				case 1:
					printf("%d as a Roman numeral would be I.\n", number);
					break;
				case 2:
					printf("%d as a Roman numeral would be II.\n", number);
					break;
				case 3:
					printf("%d as a Roman numeral would be III.\n", number);
					break;
				case 4:
					printf("%d as a Roman numeral would be VI.\n", number);
					break;
				case 5:
					printf("%d as a Roman numeral would be V.\n", number);
					break;
				case 6:
					printf("%d as a Roman numeral would be VI.\n", number);
					break;
				case 7:
					printf("%d as a Roman numeral would be VII.\n", number);
					break;
				case 8:
					printf("%d as a Roman numeral would be VIII.\n", number);
					break;
				case 9:
					printf("%d as a Roman numeral would be IX.\n", number);
					break;
				case 10:
					printf("%d as a Roman numeral would be X.\n", number);
					break;
				case 111:
					return 0;
				default:
					printf("That was not a valid entry. Try again with a number between 1 and 10, or the exit value.\n");
					break;
			}
		} while(number != 111);
	}

	```

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

	**Answer:** Yes. The switch case on line 30 does not have a `break` in it.


@. Upper managment was very happy with your help finding the mobile order issue in the system. So happy, in fact, that you ended up having a small article in the company newsletter. You were elated to be recognized for your good work. 

	You recieved an email the evening of the release of the newsletter from an anonymous address. 

	> From: ~~redacted~~
	> Subject: RECRUITMENT CHALLENGE 
	>
	> Greetings.
	>
	> We are very aware of your recent programming accomplishments. We have decided to extend an opportunity of employment to you. Successful completion our challenge will be taken as an acceptance of the offer. **It is advised to look up an ascii table.** Best of luck. 
	>

	Attached to the email was a code snippet and the challenge. You have been tasked with predicting the output of the code snippet given specific inputs. The input list is separated by commas. 

	> 5, 'm'
	> 82, 'i'
	> 15, 'i'
	> 'B', 't'
	> 0, 'h'

	``` c
	int option;
	int subOption;

	...

	switch(option)
		{
			case 5:
				printf("Hello, World!");
			case ' ' + 'z':
				printf("?");
				break;
			case 78:
				printf("Nintendo Switch");
				break;
			case 15:
				printf("Switch Statements.");
			case 'B':
				switch(subOption)
					{
						case 'i':
							printf("Alphabet Soup");
							break;
						case 'm':
							printf("Sonder by");
						case 'e':
							printf(" The Wrecks");
							break;
						case 't':
							printf("Break ");
							break;
					}
			case 1:
				printf("check!");
				break;
			case 27 + 54:
			default:
				printf("Fallout 76");
				break;
			case 'Q' + 1:
				printf("Baby ");
			case 3:
				printf("Shark");
				break;
			case 291:
				printf("Croissantwich? What?");
				break;
			case 20 * '\0':
				break;
		} 

	...
	```

	**Answer:** Hello, World!?
	            Baby Shark
	            Switch Statements.Alphabet Soup
	            Break check!
	            \[NO OUTPUT\]