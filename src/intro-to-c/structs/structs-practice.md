# Structs

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

3. My hands are aching from writing code 24/7. I alone kept the 2018 electoral interference at bay. How can I save myself the 6 keystrokes and stop typing `struct` every time I want to create an instance of the `my_structure` struct? See the previous question on line 9 for reference.

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

5. Fill in the blanks to give students names, calculate their grade average, and print it out.

  ``` c
  struct gradebook
  {
    char student[128];
    int grades[10];
    double avg;
  };

  typedef struct gradebook gradebook;

  void calculate_student_avg(gradebook *class, _____)
  {
    double sum;
    for (int i = 0; i < _____; i++)
    {
      sum = _____;
      for (int j = 0; j _____ 10; j++)
      {
        sum += class[i].grades[_____];
      }
      class[i].avg = sum / _____;
    }
  }

  void print_averages(_____, _____)
  {
    for (int i = 0; _____; i++)
    {
      printf("Average for _____ is %lf\n", _____, _____[i].avg);
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
    _____(cop3223[0].student, "Frances E. Allen");
    _____(__________________, "Barbara Liskov");
    _____________________________________________
    // Find average
    calculate_student_avg(_____, n);

    // Print average
    print_averages(_____, _____);
    
    return 0;
  }
  ```

6. I want to create a bank that handles a single person's money, no one elses. This person's balance is divided into how many dollars and cents they have. However, when I run this program (1) the person can withdraw more money than it has, (2) they can deposit a negative amount, (3) they lose all of their cents, (4) their balance is sometimes completely weird, and (5) the `deposit` and `withdraw` functions don't work. How can I solve this?

  ``` c
  struct balance
  {
    int dollars;
    int cents;
    double total;
  };

  void deposit(struct balance *checking, double amount)
  {
    (&checking).dollars += amount;
  }

  void withdraw(struct balance *checking, double amount)
  {
    *checking.dollars -= amount;
  }

  int main(void)
  {
    struct balance my_checking;

    deposit(&my_checking, -100);
    withdraw(&my_checking, 1E6);

    deposit(&my_checking, 145.54);
    withdraw(&my_checking, 0.01);

    return 0;
  }
  ```
