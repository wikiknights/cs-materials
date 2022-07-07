# Switch Statements

Here is some additional practice with switch statements. 

@. You're a time traveler with a computer, but it happens to have very limited capabilities thanks to the time police. You also happen to be a history buff that loves the Roman Empire, so you traveled back in time with your silly little programable computer to the silly little Roman Empire. You've decided to teach the Romans modern arabic numbers rather than their weird letter numbers. To expidite the teaching process, you want to make a program that can convert modern integers into Roman numerals up to 10. Write a program that uses a switch statement to convert integers up to 10 into Roman numerals. Hint: Remember, the Romans didn't have a number for 0, and they would probably like to be prompted for an input. You would also like them to be able to keep the program running to their hearts' content. 

**Answer:**

``` c
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