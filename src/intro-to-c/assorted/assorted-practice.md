# Assorted Practice Problems

*Originally created by Idel Martinez and Jerrett Longworth in Fall 2020.*

For all questions, assume all necessary libraries are included, and all function calls are properly defined.

1. In how many lines will the print statement in line 6 output?

  ``` c lineNumber
  int main(void)
  {
    char buffer[128];
    printf("How is life like in Jupiter? ");
    fgets(buffer, 127, stdin);
    printf("The user wrote life is %s in Jupiter.\n", buffer);

    return 0;
  }
  ```

2. In how many lines will the print statement in line 9 output?

  ``` c lineNumber
  int main(void)
  {
    char buffer[128];

    printf("How is life like in Jupiter? ");
    fgets(buffer, 127, stdin);
    remove_crlf(buffer);

    printf("The user wrote life is %s in Jupiter.\n", buffer);

    return 0;
  }
  ```

3. What is the output if the user entered "not good"?

  ``` c
  int main(void)
  {
    char buffer[128];

    printf("How is life like in Jupiter? ");
    fgets(buffer, 127, stdin);
    remove_crlf(buffer);
    remove_crlf(buffer);
    remove_crlf(buffer);

    printf("The user wrote life is %s in Jupiter.\n", buffer);

    return 0;
  }
  ```

4. What is the output if the user entered "3.14"?

  ``` c
  void print_fav_num(void)
  {
    char buffer[128];
    int fav_num;

    printf("What is your favorite number? ");
    fgets(buffer, 127, stdin);
    remove_crlf(buffer);
    fav_num = atoi(buffer);

    printf("Your number is %d!\n", fav_num);
  }
  ```

5. How many times will the following loop run? (Hint: Don't try to run it)

  ``` c
  void the_coolest_loop(void)
  {
    int i;

    for (i = 0; i < 10; i--)
    {
      printf("i is %d!\n", i);
    }
  }
  ```

6. What will the print statements in lines 9 and 17 output? Will it be the same? (You may use a calculator if you want to be exact.) Assume that uninitialized variables in C get assigned garbage values.

  ``` c lineNumber
  void print_sums(void)
  {
    int sum;

    for (int j = 0; j != 10; j++)
    {
      sum = sum + j;
    }
    printf("Sum is %d\n", sum);
    printf("Resetting...\n");

    sum = 0;
    for (int j = 0; j != 10; j++)
    {
      sum = sum + j;
    }
    printf("Sum is now %d\n", sum);
  }
  ```

7. What will be the function output if the user runs the program two times. The first time, the user enters "yes" and "179.67". The second time, the user enters "no".

  ``` c
  void multiply(void)
  {
    char buffer[128] = "100.23134";
    double num;

    printf("The number is %s! But sadly, it is a string.\n", buffer);
    printf("Converting the string number to a double...\n");
    num = atof(buffer);

    printf("It should now be a number, let's do some math!\n");
    printf("%lf * 71 = %lf\n", num, num * 71);

    printf("Would you like to multiply %lf by some number? ", num);
    // Here I go overwriting the buffer, oh no! What is going to happen?!
    fgets(buffer, 127, stdin);
    remove_crlf(buffer);

    printf("You entered %s\n", buffer);
    if (strcasecmp(buffer, "yes") == 0) // User wants to multiply our number by something.
    {
      printf("Amazing! What do you want to print the number by? ");
      fgets(buffer, 127, stdin);
      remove_crlf(buffer);
      printf("Cool beans, you want to print it by %s. Let's do it.\n", buffer);

      printf("%lf * %s = %lf\n", num, buffer, num * atof(buffer));
    }
    else
    {
      printf(":( Fine.\n");
    }

    printf("I am exiting now...\n");
  }
  ```

8. How many lines total will the following program print out?

  ``` c
  void ignore_user_input(void)
  {
    char buffer[128];
    printf("Hello.\nHow\nAre\nYou? ");
    fgets(buffer, 127, stdin);

    printf("Hello.\n");
    printf("How\n");
    printf("Are\n");
    printf("You? ");
    fgets(buffer, 127, stdin);

    printf("I don't really care, so goodbye!\n");
  }
  ```

9. In how many lines will the print statement in line 5 output?

  ``` c lineNumber
  void boring_print(void)
  {
    char buffer[128] = "I am a string\nth\nat\n\t\tis\nsplit weirdly...\n :S\n";

    printf("%s", buffer);
  }
  ```

10. What will the following functions print out if the user enters "2.718" for both `print_num` and `print_another_num`?

  ``` c
  void print_num(void)
  {
    char buffer[128];
    float a;

    printf("What is a? ");
    fgets(buffer, 127, stdin);
    remove_crlf(buffer);

    printf("You said that a is %s\n", buffer);
    printf("I am going to set a equal to that\n");

    a = buffer;

    printf("a is %f\n", a);
  }

  void print_another_num(void)
  {
    char buffer[128];
    float a;

    printf("What is a? ");
    fgets(buffer, 127, stdin);
    remove_crlf(buffer);

    printf("You said that a is %s\n", buffer);
    printf("I am going to set a equal to that\n");

    a = atof(buffer);

    printf("a is %f\n", a);
  }
  ```

11. What will the following function output?

  ``` c
  void print_bob_name(void)
  {
    char buffer[128] = "My name is Bob\n";
    buffer[2] = '\0';

    printf("The string is %s\n", buffer);
  }
  ```

12. What does this function print?

  ``` c
  void funky_print(void)
  {
    char buffer[128] = "How are you?";

    for (int i = 0; buffer[i] != '\0'; i++) // What is this doing?
    {
      printf("%c", buffer[i]); // omg a %c !!
    }
  }
  ```

13. Similar to the previous question, what does function print?

  ``` c
  void cool_print(void)
  {
    char buffer[128] = "How are you?";
    int length = strlen(buffer);

    for (int i = 0; i < length; i++) // What is this doing?
    {
      printf("%c", buffer[i]);
    }
  }
  ```

14. What will `main` print in lines 10, 12, and 14?

  ``` c lineNumber
  void add_num(int x, int y)
  {
    x = x + y;
  }

  int main(void)
  {
    int x = 10;

    printf("At first x was %d\n", x);
    add_num(20, 10);
    printf("Now x is %d\n", x);
    add_num(x, 10);
    printf("While x is now %d\n", x);

    return 0;
  }
  ```

15. What will `main` print in lines 12, 14, and 16?

  ``` c lineNumber
  int x;

  void add_num(int y)
  {
    x = x + y;
  }

  int main(void)
  {
    x = 10;

    printf("At first x was %d\n", x);
    add_num(20);
    printf("Now x is %d\n", x);
    add_num(10);
    printf("While x is now %d\n", x);

    return 0;
  }
  ```

---

**Challenge**  
Create a program that asks the user for grades, prompting them to keep entering grades and saving them into an array. Once the user is done or the program reaches the maximum amount of grades that can be entered, print out the list of grades in the format below, along with the average.

As a requirement, make sure to include the following three function signatures:

* `int get_grades(float *grades, int n);`  
  Prompt the user for a grade, save it to the `grades` array, then ask the user if they want to enter another grade. Repeat until a maximum amount of grades have been entered (however long you declare your array to be) or the user enters anything that is not "y" or "yes". **Return** the number of grades entered.

* `void print_grades(float *grades, int n);`  
  Print all of the grades entered in a line, followed by a comma and space or a newline character, as necessary.

* `void average_grades(float *grades, int n);`  
  Add all of the grades entered and divide it by the total amount of grades. Print the result.

You can create additional helper functions if you need them.

Example. If the user enters 7.3, 8.4, and 9.0. Your program will print the following:
```
You entered 3 grades. Here is a list of them:

7.30, 8.40, 9.00

Based on the previous grades, the average is: 8.23
```

As an extra challenge, find the maximum and minimum grades the user entered and print them.
