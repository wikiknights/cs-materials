---
title: Switch Statements (Solutions)
author: Matthew Gibbons
---

Here is some additional practice with switch statements.

@. You're a time traveler with a computer, but it happens to have very limited capabilities thanks to the Time Police. You also happen to be a history buff that loves the Roman Empire, so you traveled back in time with your silly little programmable computer to the silly little Roman Empire. You've decided to teach the Romans modern Arabic numbers rather than their weird letter numbers. To expedite the teaching process, you want to make a program that can convert modern integers into Roman numerals up to 10. Write a program that uses a switch statement to convert integers up to 10 into Roman numerals. Hint: Remember, the Romans didn't have a number for 0, and they would probably like to be prompted for an input. You would also like the program to stay running rather than restarting for every input. The Time Police Limited Computer (TTPLC) only allows one program to be run a month. Thanks, Time Police.

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


@. Upper management was very happy with your help finding the mobile order issue in the system. So happy, in fact, that you ended up having a small article in the company newsletter. You were elated to be recognized for your good work.

	You received an email the evening of the release of the newsletter from an anonymous address.

	> From: ~~redacted~~
	>
	> Subject: RECRUITMENT CHALLENGE
	>
	> Greetings.
	>
	> We are very aware of your recent programming accomplishments. We have decided to extend an opportunity of employment to you. Successful completion our challenge will be taken as an acceptance of the offer. **It is advised to look up an ASCII table.** Best of luck.
	>

	Attached to the email was a code snippet and the challenge. You have been tasked with predicting the output of the code snippet given specific inputs. The input list will be separated by commas.

	> 5, 109
	>
	> 82, 105
	>
	> 15, 105
	>
	> 66, 116
	>
	> 0, 104

	**Note:** `\0` is the `NULL` character.

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
	            Switch Statements.Alphabet Soupcheck!
	            Break check!
	            \[NO OUTPUT\]



@. You, a master of switch statements, successfully analyzed the code and sent your answer as a reply and went to bed. The following morning, you had another email, this time from the Time Police, congratulating you on your successful completion of the challenge and your new position as a Time Police programmer. You graciously accept the offer, as they offer great benefits, good pay, and the option to work remotely or in person.

	Your first project is to program their phone system. There are several requirements, but they give them to you in a very handy list.

	>- There will be six options. 1 - 5 and 0 for operator.
	>- There should not be a prompt to press 0, as it is for internal use only.
	>- The first option should be for time emergencies and have no sub options.
	>- Options 2 - 5 should be for time travel requests, time ban appeals, time fine payment, and human resources.
	>- Each option should have four or five sub-options, including an unprompted 0 option.
	>- Human resources should have 3 sub-options, including the 0 option.
	>- For the main menu, the default case should be for inputs not on the list (6 - 9).
	>- The 0 option should take the user to the front desk of the menu it is on.

	They provided an example to give you a general idea of the expected prompts:

	``` c
	#include <stdio.h>

	int main(void)
	{
	...


		printf("Press 1 for Time Emergencies. Press 2 for...");
		scanf("%d", &option);

		switch(option)
		{
			case 1:
				printf("Connecting you to Time Police operator.");
				break;
			case 2:
				printf("Press 1 for SUBEXAMPLE 1. Press 2 for...");
				scanf("%d", &subOption);

				printf("Connecting you to ");
				switch(subOption)
				{
					case 1:
						printf("SUBEXAMPLE 1.");
						break;
					...
				}
				break;
			case -1:
				break;
		}
	return 0;
	}
	```

	As you may notice, -1 is the terminator value. This will also not be prompted, as that isn't an option on a phone. That is our placeholder for hanging up. It isn't required to put a -1 case in each nested switch, but you may. They will not count towards the total sub-options, but they will be included in the solution.

	The sub-options are up to you, as this is intended as practice with nested switch statements. You decide what the Time Police handle, but maintain the "connecting you to" standard. Remember, those are the expected prompts.

	**Answer:**

	``` c
	#include <stdio.h>

	int main(void)
	{
		int option;
		int subOption;


		printf("Press 1 for Time Emergencies.\n");
		printf("Press 2 for time travel requests.\n");
		printf("Press 3 for time ban appeals.\n");
		printf("Press 4 for time fine payment.\n");
		printf("Press 5 for human resources.\n");
		scanf("%d", &option);

		switch(option)
		{
			case 1:
				printf("Connecting you to Time Police operator.\n");
				break;

			// Time Travel Requests
			case 2:
				printf("Time Travel Requests\n\n");
				printf("Press 1 for 10000 BCE - 5000 BCE.\n");
				printf("Press 2 for 4999 BCE - 0 CE.\n");
				printf("Press 3 for 1 CE - 1500 CE.\n");
				printf("Press 4 for 1501 CE - Present.\n");
				scanf("%d", &subOption);

				printf("Connecting you to");
				switch(subOption)
				{
					case 1:
						printf(" Ancient BCE Time Travel.\n");
						break;
					case 2:
						printf(" Recent BCE Time Travel.\n");
						break;
					case 3:
						printf(" Distant CE Time Travel.\n");
						break;
					case 4:
						printf(" Recent CE Time Travel.\n");
						break;
					case 0:
						printf(" Time Travel front desk.\n");
						break;
					case -1:
						break;
				}
				break;

			//Time Ban Appeals
			case 3:
				printf("Time Ban Appeals\n\n");
				printf("Press 1 for Minor Appeals.\n");
				printf("Press 2 for Moderate Appeals.\n");
				printf("Press 3 for Timeline-Altering Appeals.\n");
				scanf("%d", &subOption);

				printf("Connecting you to");
				switch(subOption)
				{
					case 1:
						printf(" Minor Appeals.\n");
						break;
					case 2:
						printf(" Moderate Appeals.\n");
						break;
					case 3:
						printf(" Timeline-Altering Appeals.\n");
						break;
					case 0:
						printf(" Time Ban Appeals front desk.\n");
						break;
					case -1:
					break;
				}
				break;

			//Time Fine Payment
			case 4:
				printf("Time Fine Payment\n\n");
				printf("Press 1 for Fine Balance.\n");
				printf("Press 2 for Billing.\n");
				printf("Press 3 for Payment Plans.\n");
				scanf("%d", &subOption);

				printf("Connecting you to");
				switch(subOption)
				{
					case 1:
						printf(" Time Accounts office.\n");
						break;
					case 2:
						printf(" Billing office.\n");
						break;
					case 3:
						printf(" Payment office.\n");
						break;
					case 0:
						printf(" Business office front desk.\n");
						break;
					case -1:
					break;
				}
				break;

			// Human Resources
			case 5:
				printf("Human Resources\n\n");
				printf("Press 1 for Application Status.\n");
				printf("Press 2 for Openings.\n");
				scanf("%d", &subOption);

				printf("Connecting you to");
				switch(subOption)
				{
					case 1:
						printf(" Application office\n");
						break;
					case 2:
						printf(" Employment Opportunity Directory.\n");
						break;
					case 0:
						printf(" Human Resources front desk.");
						break;
					case -1:
					break;
				}
				break;
			case 0:
				printf("Connecting you to Time Police front desk.\n");
				break;

			// Hang up
			case -1:
				break;

			default:
				printf("That was not one of the options.\n");
				break;
		}
		return 0;
	}
	```
