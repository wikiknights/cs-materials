# Binary I/O (Answers)

*Originally created by Idel Martinez and Jerrett Longworth in Fall 2020.*

Here is some additional practice using binary I/O. Some of these might take a little bit of thinking, but this practice is here to help you get more comfortable with the material.

Assume big-endian notation.

1. Let's start this off simple. Suppose that an `int` created in C is 4 bytes (32 bits) in size. How would the integer `2` be stored in binary in memory?

  **Answer:** `00000000 00000000 00000000 00000010`

\newpage

2. Given the previous answer, if a hypothetical program was written to write the integer `2` *in binary* to a file, what data would be in the file? Write your answer *in binary*.

  **Answer:** `00000000 00000000 00000000 00000010`

\newpage

3. Given the following program, what would `output.bin` contain after execution? Again, write your answer *in binary*. Assume all necessary libraries are included and all files are opened/closed properly.

  ``` c
  struct cool_struct
  {
    int x;
  };

  int main(void)
  {
    struct cool_struct basically_just_an_int;
    FILE *ofp = fopen("output.bin", "wb");

    basically_just_an_int.x = 2;

    fwrite(&basically_just_an_int, sizeof(struct cool_struct), 1, ofp);

    fclose(ofp);

    return 0;
  }
  ```

  **Answer:** `00000000 00000000 00000000 00000010`
