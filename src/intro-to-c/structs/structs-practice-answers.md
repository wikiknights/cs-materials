# Structs (Answers)

*Originally created by Idel Martinez and Jerrett Longworth in Fall 2020.*

Here is some additional practice using structs. Some of these might take a little bit of thinking, but this practice is here to help you get more comfortable with the material.

1. Given the following code, what would be printed in `main()`? Would it compile at all? Assume all necessary libraries are included.

  ``` c
  struct my_structure
  {
    int x;
    char text[64];
  };

  int main(void)
  {
    struct my_structure structy_mc_struct_face;

    printf("%d\n", structy_mc_struct_face.x);

    return 0;
  }
  ```

  **Answer:** This is an undefined (garbage) value.

\newpage

2. What about this? (*Hint:* An [ASCII table is available here](http://www.asciitable.com/) for your convience.)

  ``` {.c .numberLines}
  struct my_structure
  {
    int x;
    char text[64];
  };

  int main(void)
  {
    struct my_structure structy_mc_struct_face;
    structy_mc_struct_face.x = 65;

    printf("%c\n", structy_mc_struct_face.x);

    return 0;
  }
  ```

  **Answer:** `A`

\newpage

3. My hands are aching from writing code 24/7. I alone kept the 2018 electoral interference at bay. How can I save myself the 6 keystrokes and stop typing `struct` every time I want to create an instance of the `my_structure` struct? See the previous question on line 9 for reference.

  **Answer:** After the `struct` declaration, add the following line:

  ``` c
  typedef struct my_structure _______
  ```

  This blank could be anything I desire, as long as I remember to use that for the rest of my code. This is a possible example:

  ``` c
  struct my_structure
  {
    int x;
    char text[64];
  };

  typedef struct my_structure my_s;

  int main(void)
  {
    my_s structy_mc_struct_face;
    structy_mc_struct_face.x = 65;

    printf("%c\n", structy_mc_struct_face.x);

    return 0;
  }
  ```

\newpage

4. Good. The world is still going to be safe, but now I have a new (completely unrelated) problem. Suppose I am teaching an introduction to C programming class at a university, but for some reason this university didn't pick a system to store course material and grades. (Something called "Webcourses" was suggested, but it didn't seem to catch on.) That said, now I want to create my own system of storing student grades. I have some basic code to get started, but it needs some work. How can I set the names of my 3 students in class to "Alice", "Bob", and "Charlie"?

  ``` c
  struct gradebook
  {
    char student[128];
    int grades[10];
    double avg;
  };

  typedef struct gradebook gradebook;

  int main(void)
  {
    int n = 3;
    gradebook cop3223[n];

    // Your code goes here
  }
  ```

  **Answer:**

  ``` c
  struct gradebook
  {
    char student[128];
    int grades[10];
    double avg;
  };

  typedef struct gradebook gradebook;

  int main(void)
  {
    int n = 3;
    gradebook cop3223[n];

    // Your code goes here
    strcpy(cop3223[0].name, "Alice");
    strcpy(cop3223[1].name, "Bob");
    strcpy(cop3223[2].name, "Charlie");
  }
  ```

\newpage

5. Fill in the blanks to give students names, calculate their grade average, and print it out.

  **Answer:**

  ``` c
  struct gradebook
  {
    char student[128];
    int grades[10];
    double avg;
  };

  typedef struct gradebook gradebook;

  void calculate_student_avg(gradebook *class, int n)
  {
    double sum;

    for (int i = 0; i < n; i++)
    {
      sum = 0;
      for (int j = 0; j < 10; j++)
      {
        sum += class[i].grades[j];
      }
      class[i].avg = sum / 10;
    }
  }

  void print_averages(gradebook *class, int n)
  {
    for (int i = 0; i < n; i++)
    {
      printf("Average for %s is %lf\n", class[i].student, class[i].avg);
    }
  }

  int main(void)
  {
    int n = 3;
    gradebook cop3223[n];

    // Filling in student grades with data
    for (int i = 0; i < n; i++)
    {
      for (int j = 0; j < 10; j++)
      {
        cop3223[i].grades[j] = (i + 1) * (j + i);
      }
    }

    // Add student names
    strcpy(cop3223[0].student, "Frances E. Allen");
    strcpy(cop3223[1].student, "Barbara Liskov");
    strcpy(cop3223[2].student, "Valerie Taylor");

    // Find average
    calculate_student_avg(cop3223, n);

    // Print average
    print_averages(cop3223, n);

    return 0;
  }
  ```

\newpage

6. I want to create a bank that handles a single person's money, no one elses. This person's balance is divided into how many dollars and cents they have. However, when I run this program (1) the person can withdraw more money than it has, (2) they can deposit a negative amount, (3) they lose all of their cents, (4) their balance is sometimes completely weird, and (5) the `deposit` and `withdraw` functions don't work. How can I solve this?

  **Answer:**

  ``` c
  struct balance
  {
    int dollars;
    int cents;
    double total;
  };

  struct balance get_currency(double amount)
  {
    struct balance money;

    money.dollars = amount;
    money.cents = (int) (amount * 100) % 100;
    money.total = money.dollars + money.cents / 100;

    return money;
  }

  int compare_currency(struct balance temp1, struct balance temp2)
  {
    if (temp1.dollars == temp2.dollars)
    {
      return temp1.cents >= temp2.cents;
    }

    return temp1.dollars > temp2.dollars;
  }

  void deposit(struct balance *checking, double amount)
  {
    struct balance temp = get_currency(amount);

    if (amount > 0)
    {
      checking->dollars += temp.dollars;
      checking->cents += temp.cents;

      if (checking->cents >= 100)
      {
        checking->dollars++;
        checking->cents -= 100;
      }
    }
  }

  void withdraw(struct balance *checking, double amount)
  {
    struct balance temp = get_currency(amount);

    if (compare_currency(*checking, temp))
    {
      checking->dollars -= temp.dollars;
      checking->cents -= temp.cents;

      if (checking->cents < 0)
      {
          checking->dollars--;
          checking->cents += 100;
      }
    }
    else
    {
      printf("Cannot withdraw.\n");
    }
  }

  int main(void)
  {
    struct balance my_checking = {0, 0};

    deposit(&my_checking, -100);
    withdraw(&my_checking, 1E6);

    deposit(&my_checking, 145.54);
    withdraw(&my_checking, 0.01);

    return 0;
  }
  ```
