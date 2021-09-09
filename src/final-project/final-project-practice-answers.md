# The Final Project...

Let's revisit dynamic memory allocation with `realloc()`, a peek into program organization, and steps on starting the project - along with a sample grocery list program.

1. Create a program that asks for user input and stores it in an array. At the end of the program, print all of the numbers entered by the user.

	**Answer**:

	``` c
	// typedef <ANYTHING> <NEW_TYPE>
	// Equivalent to: typedef struct ArrayList ArrayList;
	typedef struct ArrayList
	{
		int size;      // Current size
		int capacity;  // Total amount of space that can be used
		int *array;
	} ArrayList;

	void remove_crlf(char *s)
	{
		char *t = s + strlen(s) - 1;

		while ((t >= s) && (*t == '\n' || *t == '\r'))
		{
			*t = '\0'; // Clobber the character t is pointing at.
			t--;       // Decrement t.
		}
	}

	// Returns a pointer to a new ArrayList.
	// Uses an initial capacity of 5.
	ArrayList *create_list(void)
	{
		ArrayList *list = calloc(1, sizeof(ArrayList));

		list->size = 0;   // This line is not *technically* necessary. Can you see why?
		list->capacity = 5;
		list->array = malloc(sizeof(int) * list->capacity);

		return list;
	}

	// Free an ArrayList.
	void free_list(ArrayList *list)
	{
		if (list == NULL)
			return;

		free(list->array);
		free(list);
	}

	// Doubles the array inside an ArrayList and adjusts the capacity accordingly. 
	void resize_list(ArrayList *list)
	{
		int *tmp = list->array;
		list->array = realloc(list->array, sizeof(int) * (list->capacity * 2));
		if (list->array == NULL)
		{
			list->array = tmp;
			return;
		}
		list->capacity *= 2;
	}

	// Add the integer n to the end of the ArrayList, expanding it if necessary.
	// NOTE: Does not guard against a failure to resize the ArrayList.
	void appendList(ArrayList *list, int n)
	{
		if (list->size == list->capacity)
		{
			resize_list(list);
		}

		list->array[list->size] = n;
		list->size++;
	}

	void print_list(ArrayList *list)
	{
		if (list == NULL)
			return;

		// Example output: [6, 1, 4, 4, 10, 1, ___, ___, ___, ___]
		printf("[");
		for (int i = 0; i < list->capacity; i++)
		{
			if (i >= list->size)
				printf("___");
			else
				printf("%d", list->array[i]);
			
			if (i < list->capacity - 1)
				printf(", ");
		}
		printf("]\n");
	}

	int main(void)
	{
		// This will temporarily store the latest integer entered.
		int currentNumber;

		// Create a buffer for text and create our ArrayList to store values.
		char buffer[128];
		ArrayList *numbers = create_list();

		printf("Give me numbers!!!!!\n");

		while (1)
		{
			// Read the input
			fgets(buffer, 127, stdin);
			remove_crlf(buffer);

			// If the user enters 'q', stop.
			if (strcmp(buffer, "q") == 0)
				break;
			
			// Store the number in the ArrayList.
			currentNumber = atoi(buffer);
			appendList(numbers, currentNumber);
		}

		print_list(numbers);

		free_list(numbers);

		return 0;
	}
	```

2. Create a struct for school supplies that contains the number of pencils, pens, papers, computers, and books. Use constructor and destructor functions to allocate the structure. Prompt the user for the number of supplies previously listed.

	**Answer**:

	``` c
	typedef struct Supplies
	{
		char *name;
		int pencils;
		int pens;
		int computers;
		int books;
	} Supplies;

	// Print the supplies found in the closet.
	void print_supplies(Supplies *closet)
	{
		printf("Closet %s has %d pencils, %d pens, %d computers, and %d books.\n\n",
			closet->name, closet->pencils, closet->pens, closet->computers, closet->books);
	}

	// Get all supply information and store it into the supplies closet struct.
	void enter_supplies(Supplies *closet)
	{
		printf("Enter name of this closet: ");
		scanf("%127s", closet->name); // Accept a string of size 127 with no spaces.

		printf("Enter number of pencils: ");
		scanf("%d", &(closet->pencils));

		printf("Enter number of pens: ");
		scanf("%d", &(closet->pens));

		printf("Enter number of computers: ");
		scanf("%d", &(closet->computers));

		printf("Enter number of books: ");
		scanf("%d", &(closet->books));

		printf("\n");
	}

	// Allocate memory for the new closet AND assign values to it.
	// Notice that we call `enter_supplies` here to assign these values from the constructor function.
	// An alternative would be to call `enter_supplies` from main, but we save some lines of code by having it here.
	Supplies *get_closet_info(void)
	{
		Supplies *temp = malloc(sizeof(Supplies));
		temp->name = malloc(sizeof(char) * 128); // Allocate memory for a string of 127 characters.

		enter_supplies(temp);

		return temp;
	}

	// Deconstruct the struct by deallocating the memory related to it.
	void free_closet(Supplies *closet)
	{
		if (closet == NULL)
			return;
		
		free(closet->name);
		free(closet);
	}

	int main(void)
	{
		// We allocate memory to the closets and assign values to it.
		// This is a much cleaner and organized way to do this; imagine having all the code in the constructor
		// in main twice for closet1 and closet2.
		Supplies *closet1 = get_closet_info();
		Supplies *closet2 = get_closet_info();

		print_supplies(closet1);
		print_supplies(closet2);

		free_closet(closet1);
		free_closet(closet2);

		return 0;
	}
	```

---

**Challenge**  
Create a program that asks to input their grocery list, record all of the user's inputs and operations in a tape file. The program will function as listed in the steps below:

1. Prompt for, and accept, an operation described below and return to step 1 (unless otherwise stated):

	| operation   | description                                                                  |
	|:------------|:-----------------------------------------------------------------------------|
	| new         | enter new item, go to step 2                                                 |
	| c           | clear                                                                        |
	| total       | print list of items                                                          |
	| last        | print the previous entered item and amount, and prompt to enter 'last' again |
	| q           | quit program                                                                 |

2. Prompt for, and accept the item to be added to the list. Can **c**lear to go to step 1 or **q**uit to exit the program.

3. Prompt for, and accept, an integer number of the amount you will be buying for the previous item entered. Can **c**lear to go to step 1 or **q**uit to exit the program.

4. Prompt for, and accept, a floating-point number of the previous item's price entered. Can **c**lear to go to step 1 or **q**uit to exit the program.

5. Return to step 1.

**Answer**:

``` c
typedef struct GroceryItem
{
	char product[128];
	int amount;
	float price;
} GroceryItem;

typedef struct Groceries
{
	GroceryItem *list;
	int list_size;
	int capacity;
} Groceries;

// Combination of fgets and remove_crlf, for your convenience.
void get_next_line(char *s, int max_length, FILE *ifp)
{
	char *t;

	fgets(s, max_length, ifp);
	t = s + strlen(s) - 1;

	while ((t >= s) && (*t == '\n' || *t == '\r'))
	{
		*t = '\0'; // Clobber the character t is pointing at.
		t--;       // Decrement t.
	}
}

// Enter a new grocery, or clear/quit on user input.
int new_grocery(Groceries *groceries, FILE *ofp)
{
	int idx = groceries->list_size++; // Get index of unfilled element in array and increment list size.
	char buffer[128];

	// If we exceeded our capacity for the groceries list, add more memory by reallocating.
	if (groceries->list_size >= groceries->capacity)
	{
		groceries->capacity *= 2;
		groceries->list = realloc(groceries->list, sizeof(GroceryItem) * groceries->capacity);
	}

	// We now prompt the user three times to entered grocery name, amount, and price.
	// At any point, the user can enter 'c' to clear or 'q' to quit. Notice that we check
	// this three times (after each prompt) with an if and else-if, but it's repeated so many times...
	// is there a way to condense this? Maybe through a function..?
	printf("Enter grocery item: ");
	get_next_line(buffer, 127, stdin);
	if (strcasecmp(buffer, "c") == 0)
		return 0;
	else if (strcasecmp(buffer, "q") == 0)
		return -1;
	strcpy(groceries->list[idx].product, buffer);

	printf("Enter amount to buy: ");
	get_next_line(buffer, 127, stdin);
	if (strcasecmp(buffer, "c") == 0)
		return 0;
	else if (strcasecmp(buffer, "q") == 0)
		return -1;
	sscanf(buffer, "%d", &(groceries->list[idx].amount));

	printf("Enter price of item: ");
	get_next_line(buffer, 127, stdin);
	if (strcasecmp(buffer, "c") == 0)
		return 0;
	else if (strcasecmp(buffer, "q") == 0)
		return -1;
	sscanf(buffer, "%f", &(groceries->list[idx].price));

	// Once successful, print out the newly entered grocery to the tape file.
	fprintf(ofp, "%d %s for $%.2f\n", groceries->list[idx].amount, groceries->list[idx].product, groceries->list[idx].price);
	return 1;
}

// Print the total number of groceries.
int print_total(Groceries *groceries)
{
	if (groceries->list_size == 0) // There are no groceries, so return an error.
		return -2;

	printf("Your groceries list is:\n\n");
	for (int i = 0; i < groceries->list_size; i++)
	{
		printf("–– %d %s for $%.2f/ea.\n",
			groceries->list[i].amount, groceries->list[i].product, groceries->list[i].price);
	}

	return 1;
}

// Get the last grocery the user entered and go back as many times as they want / is possible.
int get_last_grocery(Groceries *groceries)
{
	char buffer[128];
	int prev = groceries->list_size - 1; // Start with the item that was previously filled.

	// Keep going back into history as long as there are still items to go back to and the user entered 'last'.
	do
	{
		printf("The last grocery entered was:\n");
		printf("–– %d %s for %.2f/ea.\n",
			groceries->list[prev].amount, groceries->list[prev].product, groceries->list[prev].price);
		
		prev--; // Go back again in case the user wants to keep going.
		printf("\nType last to see the previous one or enter to proceed.\n");
		get_next_line(buffer, 127, stdin);
	} while (strcasecmp(buffer, "last") == 0 && prev >= 0);

	// If the user entered last buy prev is less than 0, there aren't any more items to we return -2 to
	// indicate an error happened and let main handle it.
	if (strcasecmp(buffer, "last") == 0)
		return -2;

	// Otherwise everything turned out fine and we can return 1 for success.
	return 1;
}

// Check what the next operation is and handle it from the new function we call.
// Notice how this function receives the file and the grocery list, even though it doesn't
// really use it, but instead passes it forward to another function.
int next_operation(Groceries *groceries, FILE *ofp, char *op)
{
	// Flag to be returned at the end. Simplifies our code to avoid having multiple return statements.
	int flag = -1;

	// If the user entered new, let's add a new grocery.
	// What if there is an error or we clear from there? Let the `new_grocery` handle that
	// and return here whatever *it* returns.
	if (strcasecmp(op, "new") == 0)
		flag = new_grocery(groceries, ofp);
	
	// If user entered 'c', print 0 and return to step 1.
	// Remember we use the number 0 on the flag to tell main we are clearing the program.
	else if (strcasecmp(op, "c") == 0)
		flag = 0;

	// Print out the current total, if there is one, when the user enters 'total'.
	else if (strcasecmp(op, "total") == 0)
		flag = print_total(groceries);

	// Get the last grocery item in history or return an error if we can't go back anymore.
	else if (strcasecmp(op, "last") == 0)
		flag = get_last_grocery(groceries);

	// If it's none of the above, we arrive to this else if. Finally, we check if the user entered to 'q'
	// in which case, they entered none of the operations specified, which means there's an error.
	else if (strcasecmp(op, "q") != 0)
		flag = -2;

	return flag;
}

// (Constructor) Allocate new memory for the grocery list and assign values.
Groceries *create_grocery_list(void)
{
	Groceries *temp = malloc(sizeof(Groceries));
	temp->list_size = 0;
	temp->capacity = 10;
	temp->list = malloc(sizeof(GroceryItem) * temp->capacity);

	return temp;
}

// (Destructor) Free all the memory associated with the grocery list.
void free_grocery_list(Groceries *groceries)
{
	if (groceries == NULL)
		return;
	
	free(groceries->list);
	free(groceries);
}

int main(void)
{
	Groceries *groceries = create_grocery_list();
	FILE *ofp = fopen("grocery_ouput.txt", "w");
	char buffer[128];

	// We use a do-while loop so that we can run our program at least once since
	// the buffer doesn't have a value yet. Continue running it as long as the user hasn't
	// entered 'q' to exit.
	do
	{
		printf("Enter an operation: ");
		get_next_line(buffer, 127, stdin);

		// Handle getting the next operation in another function to organize our code and
		// make it easier to handle any bugs.
		// Here we check what the function returns and handle it from there. We return:
		//   -2: There was an error.
		//   -1: We are quitting the program.
		//    0: Clear the program and go to step 1.
		//    1: Everything is fine, so continue the loop.
		switch (next_operation(groceries, ofp, buffer))
		{
			case -2:
				printf("error\n");
				fprintf(ofp, "error\n");
			case -1:
				continue;               // Check the loop condition and restart the loop if it's true, otherwise exit.
			case 0:
				printf("0\n");
				fprintf(ofp, "0\n");
				groceries->list_size--; // Decrement size of list since we cleared from the `new` operation.
			case 1:
				break;                  // Everything is fine so continue the loop.
		}
	} while (strcasecmp(buffer, "q") != 0);

	printf("Goodbye!\n");
	
	// Cleanup... close the file and free memory.
	fclose(ofp);
	free_grocery_list(groceries);

	return 0;
}
```
