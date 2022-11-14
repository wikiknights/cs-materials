---
title: Dynamic Memory Allocation
author:
  - Jerrett Longworth
  - Idel Martinez
---

Let's take a look at one of the *craziest* concepts we have in our toolkit to date: dynamically-allocated memory.

---

## Basic DMA

@. Is this program managing memory correctly? If not, how can it be fixed?

``` c
#include <stdio.h>
#include <stdlib.h>

int main(void)
{
  int integer_boi = malloc(sizeof(int));

  *integer_boi = 123456789;
  printf("integer_boi = %d\n", *integer_boi);

  free(integer_boi);

  return 0;
}
```

@. Is this program managing memory correctly? If not, how can it be fixed?

``` c
#include <stdio.h>
#include <stdlib.h>

int main(void)
{
  double *pointy_pointer;
  pointy_pointer = malloc(sizeof(double));

  *pointy_pointer = 3.14159;
  printf("*pointy_pointer = %lf\n", *pointy_pointer);

  return 0;
}
```

@. Is this program managing memory correctly? If not, how can it be fixed?

``` c
#include <stdio.h>
#include <stdlib.h>

int main(void)
{
  char *letter = NULL;
  malloc(sizeof(char));
  *letter = 'M';

  printf("The letter of the day is: %c\n", *letter);

  free(letter);

  return 0;
}
```

@. Is this program managing memory correctly? If not, how can it be fixed?

``` c
#include <stdio.h>
#include <stdlib.h>

int main(void)
{
  float *pi;

  pi = malloc(sizeof(float) * 5);
  *pi = 3.14;

  printf("pi = %.2lf\n", *pi);

  free(pi);

  return 0;
}
```

---

## Dynamically Allocated Arrays

@. Is this program managing memory correctly? If not, how can it be fixed?

``` c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(void)
{
  char *stringy;

  stringy = malloc(sizeof(char) * 30);
  strcpy(stringy, "goober");

  for (int i = 0; i < 30; i++)
  {
    free(stringy[i]);
  }

  return 0;
}
```

@. Fill in the blanks to create and fill a dynamically-allocated array of 20 integers. The array should contain the elements `[1, 2, 3, 4, ..., 20]`.

``` c
#include <stdio.h>
#include <stdlib.h>

int main(void)
{
  int *array;

  // Allocate the array
  array = _____(_____);

  // Initialize the array
  for (_____; _____; _____)
  {
    array[_____] = _____;
  }

  // Free the array
  _____;

  return 0;
}
```

---

## Dynamically Allocated Structs

@. Is this program managing memory correctly?

  ``` c
  typedef struct Computer
  {
    int memory;
    int processes;
    float power;
  } Computer;

  int main(void)
  {
    Computer *my_PC = malloc(sizeof(Computer));

    printf("Hello, world!\n");

    return 0;
  }
  ```

@. Are these two structs equal? In other words, is the condition inside the if statement `true`? What will print out in this program?

  ``` c
  typedef struct Computer
  {
    int memory;
    int processes;
    float power;
  } Computer;

  Computer *copy_struct(Computer *pc)
  {
    Computer *temp = malloc(sizeof(Computer));
    temp->memory = pc->memory;
    temp->processes = pc->processes;
    temp->power = pc->power;

    return temp;
  }

  int main(void)
  {
    Computer *my_PC = malloc(sizeof(Computer));
    Computer *my_other_PC;

    my_PC->memory = 10000;
    my_PC->processes = 29;
    my_PC->power = 79.81;
    my_other_PC = copy_struct(my_PC);

    if (my_PC == my_other_PC)
    {
      printf("Now my PC and my other PC are equal!\n");
    }
    else
    {
      printf("MEM: %d vs %d\n", my_PC->memory, my_other_PC->memory);
      printf("PRO: %d vs %d\n", my_PC->processes, my_other_PC->processes);
      printf("POW: %.2f vs %.2f\n", my_PC->power, my_other_PC->power);
    }

    free(my_PC);
    free(my_other_PC);

    return 0;
  }
  ```

@. Are these two structs equal? In other words, is the condition inside the if statement `true`? Also, what is missing from this program regarding memory management?

  ``` c
  typedef struct Computer
  {
    int memory;
    int processes;
    float power;
  } Computer;

  Computer *copy_struct(Computer *pc)
  {
    Computer *temp = pc;

    return temp;
  }

  int main(void)
  {
    Computer *my_PC = malloc(sizeof(Computer));
    Computer *my_other_PC = copy_struct(my_PC);

    if (my_PC == my_other_PC)
      printf("Now my PC and my other PC are equal!\n");

    return 0;
  }
  ```

@. Is this the correct way to handle memory for these pointer**s** to a struct?

  ``` c
  typedef struct Computer
  {
    int memory;
    int processes;
    float power;
  } Computer;

  Computer *copy_struct(Computer *pc)
  {
    Computer *temp = pc;

    return temp;
  }

  int main(void)
  {
    Computer *my_PC = malloc(sizeof(Computer));
    Computer *my_other_PC = copy_struct(my_PC);

    free(my_PC);
    free(my_other_PC);

    return 0;
  }
  ```

@. What is the value of `power` for both `my_PC` and `my_other_PC`?

  ``` c
  typedef struct Computer
  {
    int memory;
    int processes;
    float power;
  } Computer;

  Computer *copy_struct(Computer *pc)
  {
    Computer *temp = pc;
    temp->power = 100;

    return temp;
  }

  int main(void)
  {
    Computer *my_PC = malloc(sizeof(Computer));
    my_PC->power = 79.81;
    Computer *my_other_PC = copy_struct(my_PC);

    free(my_PC);
    free(my_other_PC);

    return 0;
  }
  ```

---

## CHALLENGE PROBLEMS:

@. Below we have a `Pixel` struct with the red, green, and blue components. (1) Create an array of `1024` pixels **dynamically**, (2) assign values to each pixel, and (3) free the memory associated with the array.

  ``` c
  typedef struct Pixel
  {
    int r;
    int g;
    int b;
  } Pixel;

  int main(void)
  {
    Pixel *scan_line;
    int n = 1024;

    srand(time(NULL));

    // Create an array of pixels. Your code goes here

    for (int i = 0; i < n; i++)
    {
      // Your code goes here

    }

    // Time to free. Your code goes here

    return 0;
  }
  ```

@. I keep forgetting my name, age, and birthday, so I want to create this program that stores it for me. But I'm surely not the only one with this problem, so you should use it as well. Can you help me create this program? Remember to allocate memory to a person (you), and assign a name, age, and birthday - plus free all the memory!

  ``` c
  typedef struct Birthday
  {
    int day;
    int year;
    char month[10];
  } Birthday;

  typedef struct Person
  {
    char *name;
    int age;
    Birthday birthday;
  } Person;

  int main(void)
  {
    Person *human = malloc(sizeof(Person));
    int name_length;

    human->name = malloc(sizeof(char) * (name_length + 1));

    // Your code goes here

    printf("Hello, I am %s, a %d-year-old.\n", human->name, human->age);
    printf("I was born in %s, %d, %d\n", human->birthday.month, human->birthday.day, human->birthday.year);

    return 0;
  }
  ```

---

## Using `calloc()`

@. What do lines 13 and 14 print out?

  ``` {.c .numberLines}
  typedef struct Computer
  {
    int memory;
    int processes;
    float power;
  } Computer;

  int main(void)
  {
    Computer *my_PC = calloc(1, sizeof(Computer));
    Computer *my_other_PC = malloc(sizeof(Computer));

    printf("%d\n", my_PC->memory + my_PC->processes + my_PC->power);
    printf("%d\n", my_other_PC->memory + my_other_PC->processes + my_other_PC->power);

    free(my_PC);
    free(my_other_PC);

    return 0;
  }
  ```
