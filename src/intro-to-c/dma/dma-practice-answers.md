---
title: Dynamic Memory Allocation (Solutions)
author:
  - Jerrett Longworth
  - Idel Martinez
---

Let's take a look at one of the *craziest* concepts we have in our toolkit to date: dynamically-allocated memory.

---

## Basic DMA

@. Is this program managing memory correctly? If not, how can it be fixed?

``` {.c .numberLines}
#include <stdio.h>
#include <stdlib.h>

int main(void)
{
  int integer_boi = malloc(sizeof(int));

  *integer_boi = 123456789;
  printf("integer_boi = %d\n", *integer_boi);

  return 0;
}
```

**Answer:** This program does not manage memory correctly! Notice that `integer_boi` declared on line 6 is just an integer, not an *integer pointer*. To properly utilize `malloc()`, its return value should be assigned to a pointer. The following shows this fixed:

``` c
#include <stdio.h>
#include <stdlib.h>

int main(void)
{
  int *integer_boi = malloc(sizeof(int));

  *integer_boi = 123456789;
  printf("integer_boi = %d\n", *integer_boi);

  free(integer_boi);

  return 0;
}
```

\newpage

@. Is this program managing memory correctly? If not, how can it be fixed?

``` {.c .numberLines}
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

**Answer:** This program is not managing memory correctly and has a memory leak. After the `printf()` statement on line 10, you must make sure to call `free(pointy_pointer);` to ensure all memory allocated is freed.

\newpage

@. Is this program managing memory correctly? If not, how can it be fixed?

``` {.c .numberLines}
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

**Answer:** This program has a memory leak and dereferences a null pointer. On line 7, memory for a `char` is allocated, but it is not assigned to the variable `letter`, so this allocation is effectively wasted. The following lines that dereference `letter` thus will fail, and the wasted `malloc()` call will cause a memory leak.

\newpage

@. Is this program managing memory correctly? If not, how can it be fixed?

``` {.c .numberLines}
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

**Answer:** This program does manage memory correctly! While more memory than necessary was allocated on line 8 for this program, this is considered valid.

---

\newpage

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

**Answer:** This program does not manage memory correctly. This code attempts to free each individual character of the array, which is not correct. Since there was only one call to `malloc()`, there should only be one call to `free()`. Instead, the for loop should be replaced with the following:

``` c
free(stringy);
```

\newpage

@. Fill in the blanks to create and fill a dynamically-allocated array of 20 integers. The array should contain the elements `[1, 2, 3, 4, ..., 20]`.

``` c
#include <stdio.h>
#include <stdlib.h>

int main(void)
{
  int *array;

  // Allocate the array
  array = malloc(sizeof(int) * 20);

  // Initialize the array
  for (int i = 0; i < 20; i++)
  {
    array[i] = i + 1;
  }

  // Free the array
  free(array);

  return 0;
}
```

*Editor's Note:* Your solution for the array initialization may look slightly different. This is a sample solution. The following is an example of a different (also correct) version of that for loop:

``` c
for (int i = 1; i <= 20; i++)
{
  array[i - 1] = i;
}
```

---

\newpage

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

  **Answer**: Nope, we're missing `free(my_PC)` so memory is getting leaked!

\newpage

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

  **Answer**: The structs are equal, but the conditional is false since they are NOT pointing to the same address. You will see that the values that print out will be the same for `my_PC` and `my_other_PC`, since they are equal but independent - this is why we `free` twice.

\newpage

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

  **Answer**: Notice how the `copy_struct` function, different from the previous exercise, is setting one pointer to be `my_PC`. Therefore, both pointers will be pointing to the same address and the conditional is true. Notice also that we are missing the `free`... oh no!

\newpage

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

  **Answer**: Similar to the previous exercise, `my_PC` and `my_other_PC` are pointing to the same address (they are equal to each other). This means that when we free one of the pointers, we freed the memory they were pointing to and it would be incorrect to try to `free` again, since it had been `free`d before.

\newpage

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

  **Answer**: Once again, `copy_struct` is setting the pointers equal to each other so that they are pointing to the same address. This means that any changes to one pointer will also be reflected on the other pointer, so the value of `power` is 100 for both. Notice also that we should not be using `free()` twice. Can you see why?

---

\newpage

## CHALLENGE PROBLEMS:

@. Below we have a `Pixel` struct with the red, green, and blue components. (1) Create an array of `1024` pixels **dynamically**, (2) assign values to each pixel, and (3) free the memory associated with the array.

  **Answer:**

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
    scan_line = malloc(sizeof(Pixel) * n);

    for (int i = 0; i < n; i++)
    {
      // Your code goes here
      scan_line[i].r = rand() % 256;
      scan_line[i].g = rand() % 256;
      scan_line[i].b = rand() % 256;
    }

    // Time to free. Your code goes here
    free(scan_line);

    return 0;
  }
  ```

\newpage

@. I keep forgetting my name, age, and birthday, so I want to create this program that stores it for me. But I'm surely not the only one with this problem, so you should use it as well. Can you help me create this program? Remember to allocate memory to a person (you), and assign a name, age, and birthday - plus free all the memory!

  **Answer:**

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
    int name_length = 14; // or better yet: strlen("Adele Goldberg")

    human->name = malloc(sizeof(char) * (name_length + 1));

    // Your code goes here
    strcpy(human->name, "Adele Goldberg");
    human->age = 75;

    human->birthday.day = 22;
    human->birthday.year = 1945;
    strcpy(human->birthday.month, "July");

    printf("Hello, I am %s, a %d-year-old.\n", human->name, human->age);
    printf("I was born in %s, %d, %d\n", human->birthday.month, human->birthday.day, human->birthday.year);

    free(human);

    return 0;
  }
  ```

\newpage

**Crazy advanced answer using user input and more pointers:**

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
  Birthday *birthday;
} Person;

Person *create_person(char *name, int name_length)
{
  Person *person = malloc(sizeof(Person));

  person->name = malloc(sizeof(char) * (name_length + 1));
  strcpy(person->name, name);
  person->age = 100;

  person->birthday = malloc(sizeof(Birthday));
  person->birthday->day = 1;
  person->birthday->year = 1900;
  strcpy(person->birthday->month, "January");

  return person;
}

void free_person(Person *person)
{
  if (person == NULL)
    return;

  free(person->name);
  free(person->birthday);
  free(person);
}

int main(void)
{
  Person *human = NULL;
  int name_length;
  char buffer[1024];

  printf("What is your name? ");
  scanf("%s", buffer);

  name_length = strlen(buffer);
  human = create_person(buffer, name_length);

  printf("Hello, I am %s, a %d-year-old.\n", human->name, human->age);
  printf("I was born in %s, %d, %d\n", human->birthday->month, human->birthday->day, human->birthday->year);

  free_person(human);

  return 0;
}
```

---

\newpage

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

  **Answer**: Because `calloc` sets initial values to the struct, my_PC members are all 0. `malloc` doesn't do anything to do values and can can be garbage values. So, line 13 prints 0 and line 14 prints garbage values.
