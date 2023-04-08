---
title: Introduction to GDB
author: Johnson Laguerre
---

GDB is a very useful debugging tool that allows you to see what the values in your program look like at any given point in time, and it lets you temporarily modify those values to see how your program runs, acting as if you actually made those changes in your code.

In the example below, a student is working on a program but encounters a segmentation fault (segfault). They're not sure what's causing it, but thanks to GDB, they can see what's going on "under the hood" of their program and try to solve the problem.

## Case Study: A Pointer Program

``` c
#include <stdio.h>

void multiply_by_two(int *current, int *arr);

int main(void)
{
    int arr[5] = {10, 20, 30, 40, 50};
    int *current = arr;
    int i = 0;

    printf("Before\n");
    printf("------\n");

    for (i = 0; i < 5; i++)
    {
        printf("arr[%d] = %d\n", i, *(current++));
    }
	
    current = NULL;
    multiply_by_two(current, arr);

    printf("\nAfter\n");
    printf("-----\n");

    for (i = 0; i < 5; i++)
    {
        printf("arr[%d] = %d\n", i, *(current++));
    }

    printf("\nAll done!\n");

    return 0;
}

void multiply_by_two(int *current, int *arr)
{
    int i = 0;
    current = arr;

    for (i = 0; i < 5; i++)
    {
        *(current++) = (*current * 2);
    }
	
    current = arr;
}

```

Okay, everything looks alright. Time to compile.

```
my-pc:~intro-to-c/assignments/pointers$ gcc my_file.c
my-pc:~intro-to-c/assignments/pointers$
```

Yes, no warnings! Okay, now let me run it.

```
my-pc:~intro-to-c/assignments/pointers$ ./a.out
Before
------
arr[0] = 10
arr[1] = 20
arr[2] = 30
arr[3] = 40
arr[4] = 50

After
-----
Segmentation fault
```

No, not a segfault! This can't be possible--my code is *perfect*! Fine, I guess I'll just have to debug it. Time to start typing up print statements... or maybe I can try that debugger I've been reading about. What is it called again? Oh, yeah, GDB.

## Compiling for Debugging

Alright, first I have to recompile my code with the `-g` flag.

```
my-pc:~intro-to-c/assignments/pointers$ gcc -g my_file.c
my-pc:~intro-to-c/assignments/pointers$
```

## Entering GDB

Now I need to pass GDB the program's name, and in I go.

```
my-pc:~intro-to-c/assignments/pointers$ gdb a.out
GNU gdb (Ubuntu 12.1-0ubuntu1~22.04) 12.1
Copyright (C) 2022 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
Type "show copying" and "show warranty" for details.
This GDB was configured as "x86_64-linux-gnu".
Type "show configuration" for configuration details.
For bug reporting instructions, please see:
<https://www.gnu.org/software/gdb/bugs/>.
Find the GDB manual and other documentation resources online at:
    <http://www.gnu.org/software/gdb/documentation/>.

For help, type "help".
Type "apropos word" to search for commands related to "word"...
Reading symbols from a.out...
(gdb)
```

## Finding the Problem

Let me run the program and see where it's stopping.

```
(gdb) run
Starting program: /home/my-pc/intro-to-c/assignments/pointers/a.out
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib/x86_64-linux-gnu/libthread_db.so.1".
Before
------
arr[0] = 10
arr[1] = 20
arr[2] = 30
arr[3] = 40
arr[4] = 50

After
-----

Program received signal SIGSEGV, Segmentation fault.
0x000055555555527c in main () at my_file.c:27
27              printf("arr[%d] = %d\n", i, *(current++));
(gdb)
```

Hmm, what do the variables look like when I print them?

```
(gdb) print i
$1 = 0
(gdb) print &arr
$2 = (int (*)[5]) 0x7fffffffdfe0
(gdb) print current
$3 = (int *) 0x4
(gdb)
```

Okay, so it happened on my first time through the loop, and `current` *clearly* isn't pointing to `arr`. I'll continue and see if anything else pops up.

```
(gdb) continue
Continuing.

Program terminated with signal SIGSEGV, Segmentation fault.
The program no longer exists.
(gdb)
```

## Forming a Hypothesis

Alright, so the problem is happening *before* the for loop, but where? I'll set a breakpoint at the top of `main` so I can step through the program and try to figure it out.

```
(gdb) break main
Breakpoint 1 at 0x555555555195: file my_file.c, line 6.
(gdb) run
Starting program: /home/my-pc/intro-to-c/assignments/pointers/a.out
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib/x86_64-linux-gnu/libthread_db.so.1".

Breakpoint 1, main () at my_file.c:6
6       {
(gdb)
```

Let me list out a couple of lines to see where I should go.

```
(gdb) list
1       #include <stdio.h>
2
3       void multiply_by_two(int *current, int *arr);
4
5       int main(void)
6       {
7           int arr[5] = {10, 20, 30, 40, 50};
8           int *current = arr;
9           int i = 0;
10
(gdb) list
11          printf("Before\n");
12          printf("------\n");
13
14          for (i = 0; i < 5; i++)
15          {
16              printf("arr[%d] = %d\n", i, *(current++));
17          }
18
19          current = NULL;
20          multiply_by_two(current, arr);
(gdb) list
21
22          printf("\nAfter\n");
23          printf("-----\n");
24
25          for (i = 0; i < 5; i++)
26          {
27              printf("arr[%d] = %d\n", i, *(current++));
28          }
29
30          printf("\nAll done!\n");
(gdb) 
```

That looks like enough. Since the first loop works, something must be happening in the `multiply_by_two` function. I'll skip ahead to that line and step into the function.

```
(gdb) until 20
Before
------
arr[0] = 10
arr[1] = 20
arr[2] = 30
arr[3] = 40
arr[4] = 50
main () at my_file.c:20
20          multiply_by_two(current, arr);
(gdb) step
multiply_by_two (current=0x0, arr=0x7fffffffdfe0) at my_file.c:37
37          int i = 0;
(gdb)
```

Let me list out some lines like before to get an overview.

```
(gdb) list
32          return 0;
33      }
34
35      void multiply_by_two(int *current, int *arr)
36      {
37          int i = 0;
38          current = arr;
39
40          for (i = 0; i < 5; i++)
41          {
(gdb) list
42              *(current++) = (*current * 2);
43          }
44
45          current = arr;
46      }
(gdb)
```

Okay, that's the whole function. `current` starts off pointing to `NULL`, then I set it to point to `arr` just before I leave the function. Shouldn't the `current` in `main` be pointing to `arr`, too?

Wait a minute... I learned about this! The `current` variable *here* is local to *this* function's scope. That means I actually need to set `current` to point to `arr` in the `main` function!

## Testing the Hypothesis

Let me finish this function to see if I'm right.

```
(gdb) finish
Run till exit from #0  multiply_by_two (current=0x0, arr=0x7fffffffdfe0) at my_file.c:37
main () at my_file.c:22
22          printf("\nAfter\n");
(gdb) print current = arr
$4 = (int *) 0x7fffffffdfe0
(gdb) print current
$5 = (int *) 0x7fffffffdf60
(gdb) print &arr
$6 = (int (*)[5]) 0x7fffffffdf60
(gdb)
```

Okay, now I set `current` to point to `arr`, and I can see that the addresses match. Will it work this time?

```
(gdb) continue
Continuing.

After
-----
arr[0] = 20
arr[1] = 40
arr[2] = 60
arr[3] = 80
arr[4] = 100

All done!
[Inferior 1 (process 620) exited normally]
(gdb)
```

## Making the Changes

Yes, it worked! Let me quit GDB and edit my code so I can see it if it *really*, really works.

```
(gdb) quit
```

``` c
    // In the text editor.
	
    // In the main function.
    ...
    current = NULL;
    multiply_by_two(current, arr);
    
    // Adding this line!
    current = arr; 

    printf("\nAfter\n");
    printf("-----\n");
    ...
	
    // In the multiply_by_two function.
    ...
    for (i = 0; i < 5; i++)
    {
        *(current++) = (*current * 2);
    }
	
    // Deleting this line!
    // current = arr;
}
	
```

```
my-pc:~intro-to-c/assignments/pointers$ gcc my_file.c
my-pc:~intro-to-c/assignments/pointers$ ./a.out
Before
------
arr[0] = 10
arr[1] = 20
arr[2] = 30
arr[3] = 40
arr[4] = 50

After
-----
arr[0] = 20
arr[1] = 40
arr[2] = 60
arr[3] = 80
arr[4] = 100

All done!
```

Yes, it *really*, really worked! I knew I could do it!

