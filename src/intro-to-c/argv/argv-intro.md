# Introduction to `argc` and `argv`

*Created by Jerrett Longworth in February 2022.*

You may be familiar with the good 'ol `int main(void)`, but surely, you think, there's more to it than that... and you'd be right! This lesson will introduce you to `argc` and `argv`, and how exactly they are used.

---

## Preface: The Command Line

When running programs in the command line, you may run programs like this:

```
prompt> gcc myprogram.c
prompt> ./a.out
```

`gcc` is simply a program that compiles (converts) C code to the language of zeroes and ones that computers can understand. But how exactly does the program `gcc` know that it should compile `myprogram.c` once it was specified in the command line? The answer is different depending on each programming language, but for the case of C, it's the magic of `argc` and `argv`!

---

## How `main()` normally looks

You are probably familiar with the `int main(void)` function:

``` c
#include <stdio.h>

int main(void)
{
  printf("Hello, world!\n");

  return 0;
}
```

But why does `main()` have `void` as its function parameters? Surely `main()` could take in some type of input, maybe even command line input?

*Side note:* Some courses use `int main()` (without the `void`), and while this does achieve the same goal, it is always good practice to exactly specify the parameters of a function. Using empty parentheses leaves the function with *undefined parameters*, meaning you could actually call it with any arrangement of arguments, regardless of whether or not the function would actually be able to use them. Generally, specifying a function's parameters is better practice since it strictly enforces how that function is called.

---

## What you actually came here for: `argc` and `argv`

There are multiple valid function definitions for `main()` in the C standard. Other than `int main(void)`, the next one is `int main(int argc, char *argv[])`. This allows you to receive input from the command line arguments!

There are two parts to this, `argc` and `argv`.

`argc` is short for "argument count," and tells how many elements are in the following `argv` array.

`argv` is short for "argument vector," and is a list of arguments (in the form of strings) retrieved by the command line!

Here is some example code of this in action:

``` c
#include <stdio.h>

int main(int argc, char *argv[])
{
  printf("The number of arguments passed in from the command line is %d.\n", argc);

  printf("These are the contents of argv: [");
  for (int i = 0; i < argc; i++)
  {
    printf("\"%s\"", argv[i]);
  }
  printf("]\n");

  return 0;
}
```

Here's an example of running the program with some arguments, then getting some output:

```
prompt> gcc myprogram.c
prompt> ./a.out hello!
The number of arguments passed in from the command line is 2.
These are the contents of argv: ["./a.out", "hello!"]
prompt>
```

Notice that `"./a.out"` is included in the output! The program name itself is always the first argument.