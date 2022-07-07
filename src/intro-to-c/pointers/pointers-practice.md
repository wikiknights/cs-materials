# Pointers Practice

*Problems created by Idel Martinez and Jerrett Longworth.*

Let's try some example problems using pointers!

---

## Basic Pointer Operations

@. What will this program print if executed?

  ``` c
  #include <stdio.h>

  int main(void)
  {
    int x = 7;
    int *pointer = &x;

    x = 10;
    *pointer = 75;
    printf("x = %d\n", x);

    return 0;
  }
  ```

@. What will this program print if executed?
  
  ``` c
  #include <stdio.h>

  int main(void)
  {
    int n = 43;

    printf("%d\n", *&*&*&*&*&*&n);

    return 0;
  }
  ```

---

## Function Scope

@. What will this program print if executed?

  ``` c
  #include <stdio.h>

  // This function adds 1 to an integer.
  void change_number(int n)
  {
    n++;
  }

  int main(void)
  {
    int x = 6, y = 9;

    printf("Before:\n");
    printf("x is %d\n", x);
    printf("y is %d\n", y);

    change_number(x);
    change_number(y);

    printf("After:\n");
    printf("x is %d\n", x);
    printf("y is %d\n", y);

    return 0;
  }
  ```

@. What will this program print if executed? What is the difference between this and the previous problem?

  ``` c
  #include <stdio.h>

  // This function adds 1 to an integer.
  void change_number(int *n)
  {
    *n++;
  }

  int main(void)
  {
    int x = 6, y = 9;

    printf("Before:\n");
    printf("x is %d\n", x);
    printf("y is %d\n", y);

    change_number(&x);
    change_number(&y);

    printf("After:\n");
    printf("x is %d\n", x);
    printf("y is %d\n", y);

    return 0;
  }
  ```

@. What will this program print if executed? What is the difference between this and the previous two problems?

  ``` c
  #include <stdio.h>

  // This function adds 1 to an integer.
  void change_number(int *n)
  {
    (*n)++;
  }

  int main(void)
  {
    int x = 6, y = 9;

    printf("Before:\n");
    printf("x is %d\n", x);
    printf("y is %d\n", y);

    change_number(&x);
    change_number(&y);

    printf("After:\n");
    printf("x is %d\n", x);
    printf("y is %d\n", y);

    return 0;
  }
  ```

---

## More Advanced Function Scope

@. Fill in this `swap()` function to swap the values referenced by two pointers.

  ``` c
  #include <stdio.h>

  void swap(int *a, int *b)
  {
    // Your code here
  }

  int main(void)
  {
    int num, ber;

    num = 68;
    ber = 70;

    printf("%d %d\n", num, ber);
    swap(&num, &ber);
    printf("%d %d\n", num, ber);

    return 0;
  }
  ```

@. What will this program print if executed?

  ``` c
  #include <stdio.h>

  int functiomatic(int *n)
  {
    *n = *n + 1;
    return *n + 1;
  }

  int main(void)
  {
    int b;
    int *c;

    b = 17;
    b = functiomatic(&b);
    c = &b;

    printf("*c = %d\n", *c);

    return 0;
  }
  ```

@. What will this program print if executed?

  ``` c
  #include <stdio.h>

  int functiomatic(int n)
  {
    int m = n + 1;
    return n;
  }

  int main(void)
  {
    int b;
    int *c;

    b = 17;
    b = functiomatic(b);
    c = &b;

    printf("*c = %d\n", *c);

    return 0;
  }
  ```

---

## Pointers and Arrays

@. What does `array` contain after line 13? What will this program print if executed? Assume that any uninitialized variables contain garbage values.

  ``` {.c .numberLines}
  #include <stdio.h>

  #define LENGTH 10

  int main(void)
  {
    int array[LENGTH];

    // Initialize array
    for (int i = 0; i < LENGTH; i++)
    {
      array[i] = i * 10;
    }

    // What does this array now contain?

    // Print array
    for (int i = 0; i < LENGTH; i++)
    {
      printf("%d\n", *(array + i));
    }

    return 0;
  }
  ```

@. What will `array` contain after line 34? What will this program print if executed? Assume that any uninitialized variables contain garbage values.

  ``` {.c .numberLines}
  #include <stdio.h>

  #define LENGTH 10

  void initialize_array(int *arr, int length)
  {
    for (int i = 0; i < length; i++)
    {
      arr[i] = 50 + i;
    }
  }

  void print_array(int *arr, int length)
  {
    printf("[");

    for (int i = 0; i < length; i++)
    {
      printf("%d", arr[i]);

      if (i < length - 1)
      {
        printf(", ");
      }
    }

    printf("]\n");
  }

  int main(void)
  {
    int array[LENGTH];

    initialize_array(array, LENGTH - 2);

    // What does this array now contain?

    print_array(array, LENGTH);

    return 0;
  }
  ```

---

## Pointers and Structs

@. Create a declaration of a struct called `car` that contains some information about a car: a string (char pointer) called `make` that indicates its manufacturer, a string called `model` that indicates its model, an integer called `year` that indicates its year of production, and a double called `mpg` that indicates its fuel efficiency in miles per gallon.

@. Rewrite the following line of code using the dereference (`*`) and the direct member access (`.`) operator.

  ``` c
  my_struct->number = 5;
  ```

@. What is wrong with the following `print_planet()` function? How can you fix it?

  ``` c
  struct planet
  {
    char name[30];
    double radius_km;
    char color[30];
  };

  void print_planet(struct planet p)
  {
    printf("Name: %s\n", p->name);
    printf("Radius: %lf\n", p->radius_km);
    printf("Color: %s\n", p->color);
  }
  ```

@. What will the following program print if executed?

  ``` c
  #include <stdio.h>

  struct pizza
  {
    int radius_inches;
    double price;
    char toppings[100];
  };

  void initialize_pizza(struct pizza *p)
  {
    p->radius_inches = 0;
    p->price = 0;
    p->toppings[0] = '\0';
  }

  void print_pizza(struct pizza p)
  {
    printf("Radius: %d inches\n", p.radius_inches);
    printf("Price: $%0.2lf\n", p.price);
    printf("Toppings: %s\n", p.toppings);
  }

  int main(void)
  {
    struct pizza four_meat_pizza;

    initialize_pizza(&four_meat_pizza);
    print_pizza(four_meat_pizza);

    return 0;
  }
  ```

@. What will the following program print if executed?

  ``` c
  #include <stdio.h>
  #include <string.h>

  struct pizza
  {
    int radius_inches;
    double price;
    char toppings[100];
  };

  void initialize_pizza(struct pizza *p)
  {
    p->radius_inches = 0;
    p->price = 0;
    p->toppings[0] = '\0';
  }

  void print_pizza(struct pizza p)
  {
    printf("Radius: %d inches\n", p.radius_inches);
    printf("Price: $%0.2lf\n", p.price);
    printf("Toppings: %s\n", p.toppings);
  }

  int main(void)
  {
    struct pizza four_meat_pizza;

    initialize_pizza(&four_meat_pizza);

    four_meat_pizza.radius_inches = 13;
    four_meat_pizza.price = 9.99;
    strcpy(four_meat_pizza.toppings, "Pepperoni, beef, sausage, and bacon");

    print_pizza(four_meat_pizza);

    return 0;
  }
  ```

---

## Pointers and Structs (Advanced)

@. Suppose I am teaching an introduction to C programming class at a university, but for some reason this university didn't pick a system to store course material and grades. (Something called "Webcourses" was suggested, but it didn't seem to catch on.) That said, now I want to create my own system of storing student grades. I have some basic code to get started, but it needs some work. How can I set the names of my 3 students in class to "Alice", "Bob", and "Charlie"?

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

@. Fill in the blanks to give students names, calculate their grade average, and print it out.

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

@. I want to create a bank that handles a single person's money, no one elses. This person's balance is divided into how many dollars and cents they have. However, when I run this program (1) the person can withdraw more money than it has, (2) they can deposit a negative amount, (3) they lose all of their cents, (4) their balance is sometimes completely weird, and (5) the `deposit` and `withdraw` functions don't work. How can I solve this?

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
