# Dynamic Memory Allocation

*Originally created by Jerrett Longworth and Idel Martinez in Fall 2020.*

Let's take a look at one of the *craziest* concepts we have in our toolkit to date: dynamically-allocated memory. But first, some `typedef` fun.

1. What should the blank lines be in line 9 to print out `100.00 - 89.00 = 11.00`?

  ``` c lineNumber
  int main(void)
  {
    typedef double more_precise_number;
    typedef float less_precise_number;

    more_precise_number x = 100;
    less_precise_number y = 89;

    printf("%___ - %___ = %___\n", x, y, x - y);

    return 0;
  }
  ```

2. Is this program managing memory correctly?

  ``` c
  typedef struct Computer
  {
    int memory;
    int processes;
    float power;
  } Computer;

  int main(void)
  {
    Computer *my_PC = calloc(1, sizeof(Computer));

    printf("Hello, world!\n");

    return 0;
  }
  ```

3. What do lines 13 and 14 print out?

  ``` c lineNumber
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

4. Are these two structs equal? Is the condition inside the if statement `true`? What will print out in this program?

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
    Computer *my_PC = calloc(1, sizeof(Computer));
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

5. Are these two structs equal? Is the condition inside the if statement `true`? Also, what is missing from this program regarding memory management?

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
    Computer *my_PC = calloc(1, sizeof(Computer));
    Computer *my_other_PC = copy_struct(my_PC);

    if (my_PC == my_other_PC)
      printf("Now my PC and my other PC are equal!\n");

    return 0;
  }
  ```

6. Is this the correct way to handle memory for these pointer**s** to a struct?

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
    Computer *my_PC = calloc(1, sizeof(Computer));
    Computer *my_other_PC = copy_struct(my_PC);

    free(my_PC);
    free(my_other_PC);

    return 0;
  }
  ```

7. What is the value of `power` for both `my_PC` and `my_other_PC`?

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
    Computer *my_PC = calloc(1, sizeof(Computer));
    my_PC->power = 79.81;
    Computer *my_other_PC = copy_struct(my_PC);

    free(my_PC);
    free(my_other_PC);

    return 0;
  }
  ```

8. Below we have a `Pixel` struct with the red, green, and blue components. (1) Create an array of `1024` pixels **dynamically**, (2) assign values to each pixel, and (3) free the memory associated with the array.

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

9. I keep forgetting my name, age, and birthday, so I want to create this program that stores it for me. But I'm surely not the only one with this problem, so you should use it as well. Can you help me create this program? Remember to allocate memory to a person (you), and assign a name, age, and birthday - plus free all the memory!

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
