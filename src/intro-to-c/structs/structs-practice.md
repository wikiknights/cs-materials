---
title: Structs
author:
  - Idel Martinez
  - Jerrett Longworth
---

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

---

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

@. My hands are aching from writing code 24/7. I alone kept the 2018 electoral interference at bay. How can I save myself the 6 keystrokes and stop typing `struct` every time I want to create an instance of the `my_structure` struct? See the previous question on line 9 for reference.

---

## Pointers of Structs

See the "Pointers Practice" page for practice on this!
