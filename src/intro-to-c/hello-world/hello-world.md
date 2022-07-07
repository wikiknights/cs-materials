---
title: Writing Your First C Program
author: Jerrett Longworth
---

This guide will show you how to write your first C program from scratch with only a few lines of code.

## The Code:

``` c
#include <stdio.h>

int main(void)
{
  printf("Hello, world!\n");

  return 0;
}
```

Let's run the program (in a command line) and find out what happens! (*Note:* since command lines vary wildly between systems, this will only simulate one with generic prompts and fake commands.)

``` {.console}
prompt> (I type the command to run the program...)
Hello, world!
prompt>
```

It really works! But what does it all mean? Let's break each line down and find out! (This will also introduce you to many of the concepts you will learn when learning C!)

---

## `#include <stdio.h>`

This line indicates that we would like to gain access to a *library* called "stdio.h", short for "standard I/O". A library is a collection of functions and variables (which you will learn more about later!) that you can use to your advantage while programming. A function is simply a chunk of code that you can run as many times as you want. For this example, the standard I/O library gives access to a function called `printf()`, which allows you to **print** to the screen with some **f**ormatted text.

## `int main(void)`

There's a lot to unpack on this line! This is called a *function declaration*, which will be explained much more thoroughly later.

I will start with the word `main`, which indicates that this is a piece of code (a function) that begins the C program. (There are always going to be exceptions to this, but pretend that every program will always start with `main()`.)

The text between the parentheses indicates the input to this function, but in this case `main()` will not have any input, so `void` is written there instead. That isn't to say that this *entire program* won't have any input (i.e. typing with your keyboard), but from a technical sense `main()` does not need to take in input.

Finally, the `int` at the beginning of this line states that `main()` will, once finished, return an **int**eger to whoever ran your program. (Spoiler: You can see what exactly is returned at the end of the program in the code! 0!)

## `{`

Curly braces group lines of code together into sections that can be managed as a whole. In this case, the opening curly brace is stating "everything between this curly brace and the corresponding closing curly brace are the contents of the `main()` function."

## `printf("Hello, world!\n");`

This line calls the `printf()` function, which will **print f**ormatted text to the screen. There's no formatting (yet), but there is some text. The exact structure of `printf()` is for another time, but anything within the quotation marks will be shown on screen.

But wait! What's that `\n` at the end? This is called a *newline character*, and states to print... a new line! Just like you would press "enter" at the end of a paragraph, new lines simulate that key press in programming.

Without the newline character, you may see that text runs into each other without any breaks in-between! This is much harder to read. Additionally, if you are running your program in the command line, a missing newline character at the very end will cause your command line's prompt to be on the same line as the last line of your program!

For example:

``` {.console}
prompt> (I type the command to run my program...)
Hello, world!prompt>
```

This is no good! Adding the `\n` prevents this mis-formatting from happening.

Notice as well, there is a semicolon (`;`) at the end of every executable statement in C.

## `return 0;`

At the end of every program, your computer (or more specifically your operating system) needs to know how your program went. Did it run successfully? Did it fail part of the way through? `main()` can **return** an integer value to indicate how the program ended. Returning the integer 0 indicates that everything was successful. (You will see later how other functions can return other values and datatypes.)

While the exact effect of these "return codes" are not seen too often by you in modern programs, deep down somewhere, if they finish, they too will return something, no matter what programming language or framework they were written in.

## `}`

At the very end, you need to make sure to have a matching closing curly brace for every opening curly brace.

---

You have finished creating your first C program! Congratulations!