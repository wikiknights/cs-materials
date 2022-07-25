---
title: Strings Practice (Solutions)
author:
  - Nicole Zolnier
  - Idel Martinez
  - Jerrett Longworth
toc: false
---

A fun thing to do in these exercises is to create a separate function and call it in main. That way, you can have your own library of functions and reuse it if you need.

@. Write a function that receives a string and return its length without using any libraries.

**Answer:**
```c
#include <stdio.h>

int length(char *word);

int main(void) {
    char word[30];
    printf("Enter your word.\n");
    scanf("%s", word);

    printf("The length of your word is %d\n", length(word));

    return 0;
}

// returns the length of the string pointed to by word
int length(char *word) {
    // declare the counter
    int i=0;

    // keep on counting until the null character
    while (word[i] != '\0')
        i++;

    // finally, return the counter
    return i;
}
```

@. Write a function that receives a string and turns it into uppercase.

**Answer:**
```c
#include <stdio.h>

void to_upper(char *word);

int main(void) {
    char word[30];
    printf("Enter your word.\n");
    scanf("%s", word);

    to_upper(word);
    printf("Your word is now upper case: %s\n", word);

    return 0;
}

// changes the string pointed to by word to be upper case
void to_upper(char *word) {

  int i=0;

  // go through each character one by one, changing it to upper case
  while (word[i] != '\0') {
    if (word[i] >= 'a' && word[i] <= 'z') {
      // subtract the number of ASCII characters necessary to give the uppercase letter
      word[i] = word[i] - ('a' - 'A');
    }

    i++;
  }
}
```

@. Write a function that receives two strings and checks if they are equal.

**Answer:**
```c
#include <stdio.h>

int equal(char *w1, char *w2);

int main(void) {
    char word1[30], word2[30];
    printf("Enter your word.\n");
    scanf("%s", word1);
    printf("Enter another word.\n");
    scanf("%s", word2);

    if (equal(word1, word2))
        printf("You entered two equal words.\n");
    else
        printf("Your words are different.\n");

    return 0;
}

// returns 1 if the strings pointed to by w1 and w2 are identical
// returns 0 otherwise
int equal(char *w1, char *w2) {

  int i=0;

  // keeps on going
  while (1) {
    // characters don't match, not equal!
    if (w1[i] != w2[i])
      return 0;

    // if we match the null character, the strings are equal!
    else if (w1[i] == '\0')
      return 1;

    i++;
  }
}
```

@. Write a function that receives a string and check if it is a palindrome.

**Answer:**
```c
#include <stdio.h>
#include <string.h>

int palindrome(char *word);

int main(void) {
    char word[30];
    printf("Enter your word.\n");
    scanf("%s", word);

    if (palindrome(word) == 1)
        printf("%s is a palindrome.\n", word);
    else
        printf("%s is not a palindrome.\n", word);
  
    return 0;
}

int palindrome(char *word) {

  int len, index;
  index = 0;
  len = strlen(word);

  while (word[index] == word[len-1-index] &&
         index < len/2)
    index++;

  if (index == len/2)
    return 1;

  return 0;
}
```

@. Write a function that receives a string and reverses it.

**Answer:**
```c
#include <stdio.h>

void reverse(char *word);

int main(void) {
    char word[30];
    printf("Enter your word.\n");
    scanf("%s", word);

    reverse(word);
    printf("Your word reversed is %s\n", word);
  
    return 0;
}

// reverses the contents of the string pointed to by word
void reverse(char *word) {

  int i, len;
  char temp;

  // get the length of the word
  len = length(word);

  // go half-way through
  for (i=0; i<len/2; i++) {
    // swap "opposite" side letters!
    temp = word[i];
    word[i] = word[len-1-i];
    word[len-1-i] = temp;
  }
}
```

@. **CHALLENGE:** How would you read a first and last name from the terminal, save it to a string, and display it to the screen?

**Answer:**
```c
#include <stdio.h>

int main(void) {
    char name[30];
    printf("Enter your name.\n");
    fgets(name, sizeof(name), stdin);  // read string
    puts(name);    // display string
    return 0;
}
```

---

\newpage

## More Practice Using Strings

For all questions, assume all necessary libraries are included, and all function calls are properly defined. Assume that `remove_clrf(string);` will remove any newline characters ('`\n`' or '`\r`') at the end of `string` passed in.

<details>
  <summary>(Advanced: View the contents of `remove_clrf()`.)</summary>

  ``` c
  void remove_crlf(char *s)
  {
    char *t = s + strlen(s) - 1;

    while ((t >= s) && (*t == '\n' || *t == '\r'))
    {
      *t = '\0';
      t--;
    }
  }
  ```

</details>

---

@. In how many lines will the print statement in line 5 output?

  ``` {.c .numberLines}
  void boring_print(void)
  {
    char buffer[128] = "I am a string\nth\nat\n\t\tis\nsplit weirdly...\n :S\n";

    printf("%s", buffer);
  }
  ```

  **Answer:** 6 lines.

  The output of this program will be the following:

  ```
  I am a string
  th
  at
      is
  split weirdly...
   :S
  ```

\newpage

@. What will the following function output?

  ``` c
  void print_bob_name(void)
  {
    char buffer[128] = "My name is Bob\n";
    buffer[2] = '\0';

    printf("The string is %s\n", buffer);
  }
  ```

  **Answer:** `The string is My`

  A string will only be printed until the first `\0` is reached, so by placing a `\0` in `buffer[2]`, the string will be effectively shortened.

\newpage

@. What does this function print?

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

  **Answer:** `How are you?`

  The loop will print every character in the string one-at-a-time until it encounters a null terminator.

\newpage

@. Similar to the previous question, what does function print?

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

  **Answer:** `How are you?`

  The loop will print every character in the string one-at-a-time until `i` becomes equal to the string length. In this case, `length` will be 12.

\newpage

@. In how many lines will the print statement in line 6 output?

  ``` {.c .numberLines}
  int main(void)
  {
    char buffer[128];
    printf("How is life like in Jupiter? ");
    fgets(buffer, 127, stdin);
    printf("The user wrote life is %s in Jupiter.\n", buffer);

    return 0;
  }
  ```

  **Answer:** Since `fgets()` adds the newline character at the end of user input and we don't remove it, line 6 will be split into two lines. A sample run of the program may look like this:

  ```
  How is life like in Jupiter? (pretend the user types "great")
  The user wrote life is great
   in Jupiter.
  ```

\newpage

@. In how many lines will the print statement in line 9 output?

  ``` {.c .numberLines}
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

  **Answer:** Different from the last question, we now use `remove_clrf()`, which removes the newline character from `buffer`, so line 9 will be printed out in a single line.

\newpage

@. What is the output if the user entered "not good"?

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

  **Answer:** We will get user input, remove the newline character from the end of `buffer`, and print it out. The output is "`The user wrote life is not good in Jupiter.`".

  If the user entered "not good", the buffer will first look like this:

  ```
  +----+----+----+----+----+----+----+----+----+----+---------+
  | n  | o  | t  |    | g  | o  | o  | d  | \n | \0 |   ...   |
  +----+----+----+----+----+----+----+----+----+----+---------+
   0    1    2    3    4    5    6    7    8    9
  ```

  After the first call to `remove_clrf()`, the buffer will then look like this:

  ```
  +----+----+----+----+----+----+----+----+----+----+---------+
  | n  | o  | t  |    | g  | o  | o  | d  | \0 | \0 |   ...   |
  +----+----+----+----+----+----+----+----+----+----+---------+
   0    1    2    3    4    5    6    7    8    9
  ```

  The following two calls to `remove_clrf()` do nothing since the newline character is already removed.

\newpage

@. What is the output if the user entered "3.14"?

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

  **Answer:** `Your number is 3!`

  Notice that `fav_num` is an integer, and we use `atoi()`. 3.14 will get truncated to 3.

\newpage

@. How many lines total will the following program print out?

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

  **Answer:** 9 lines.

  The output of this program will be the following:

  ```
  Hello.
  How
  Are
  You? (the user types something here)
  Hello.
  How
  Are
  You? (the user types something here)
  I don't really care, so goodbye!
  ```

---

\newpage

**Challenge:** Let's look at some more complex functions!

@. What will be the function output if the user runs the program two times? The first time, the user enters "yes" and "179.67". The second time, the user enters "no".

  ``` c
  void multiply(void)
  {
    char buffer[128] = "100.23134";
    double num;

    printf("The number is %s! But sadly, it is a string.\n", buffer);
    printf("Converting the string number to a double...\n");
    num = atof(buffer);

    printf("It should now be a number, let's do some math!\n");
    printf("%lf * 71 = %lf\n", num, num * 71); // 100.23134 * 71 = 7116.42514

    printf("Would you like to multiply %lf by some number? ", num);
    // Here I go overwriting the buffer, oh no! What is going to happen?!
    fgets(buffer, 127, stdin);
    remove_crlf(buffer);

    printf("You entered %s\n", buffer);
    if (strcmp(buffer, "yes") == 0) // User wants to multiply our number by something.
    {
      printf("Amazing! What do you want to multiply the number by? ");
      fgets(buffer, 127, stdin);
      remove_crlf(buffer);
      printf("Cool beans, you want to multiply it by %s. Let's do it.\n", buffer);

      printf("%lf * %s = %lf\n", num, buffer, num * atof(buffer));
    }
    else
    {
      printf(":( Fine.\n");
    }

    printf("I am exiting now...\n");
  }
  ```

  **Answer:**

  If the user enters "yes" and "179.67":

  ```
  100.23134 * 179.67 = 18008.56486
  ```

  If the user enters "no" (or anything else):

  ```
  :( Fine.
  ```

\newpage

@. What will the following functions print out if the user enters "2.718" for both `print_num` and `print_another_num`?

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

    // Error! Trying to directly assign a variable from another type would not
    // even allow the program to run.
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

    // This is correct.
    a = atof(buffer);

    printf("a is %f\n", a);
  }
  ```

  **Answer:**
  `print_num()` would not even be able to run due to the assignment operation.

  `print_another_num()` would print "`a is 2.718`".

---

\newpage

@. **Challenge Program:**
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

**Answer:** See **[this attached C file](https://github.com/Wiki-Knights/CS-Materials/raw/main/src/intro-to-c/strings/strings-practice-challenge-answer.c)** for this solution.