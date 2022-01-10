*Originally created by Idel Martinez in Fall 2020.*

# The Final Project...

Let's revisit dynamic memory allocation with `realloc()`, a peek into program organization, and steps on starting the project - along with a sample grocery list program.

1. Create a program that asks for user input and stores it in an array. At the end of the program, print all of the numbers entered by the user.

2. Create a struct for school supplies that contains the number of pencils, pens, papers, computers, and books. Use constructor and destructor functions to allocate the structure. Prompt the user for the number of supplies previously listed.

---

**Challenge**
Create a program that asks to input their grocery list, record all of the user's inputs and operations in a tape file. The program will function in the steps below:

1. Prompt for, and accept, an operation number described below and return to step 1 (unless otherwise stated):

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
