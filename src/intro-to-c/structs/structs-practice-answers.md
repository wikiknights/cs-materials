# Structs (Answers)

*Originally created by Idel Martinez and Jerrett Longworth in Fall 2020.*

Here is some additional practice using structs. Some of these might take a little bit of thinking, but this practice is here to help you get more comfortable with the material.

But first, some `typedef` fun.

---

## `typedef` Practice

@. What should the blank lines be in line 9 to print out `100.00 - 89.00 = 11.00`?

  ``` {.c .numberLines}
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

  **Answer**: `%lf`, `%f`, and `%lf` since `x` is a double, `y` is a float, and their subtraction is also a double.

---

\newpage

## Onto Structs!

@. Given the following code, what would be printed in `main()`? Would it compile at all? Assume all necessary libraries are included.

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

@. What about this? (*Hint:* An [ASCII table is available here](http://www.asciitable.com/) for your convience.)

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

@. My hands are aching from writing code 24/7. I alone kept the 2018 electoral interference at bay. How can I save myself the 6 keystrokes and stop typing `struct` every time I want to create an instance of the `my_structure` struct? See the previous question on line 9 for reference.

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

---

\newpage

## Pointers of Structs

See the "Pointers Practice" page for practice on this!
