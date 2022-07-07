---
title: Printing
---

## The `printf();` function

Printing a text to the screen is a big part of coding and debugging. To do that in C, we use the function `printf();`, which stands for print formatted.

For example:
``` c
#include <stdio.h>

int main(void)
{
    printf("Hello, world!");

    return 0;
}
```

This code will display  ```Hello, world!```  to the screen.

## Special Characters

If you wish to display your text a certain way, such as adding a new line or a tab, you can use some special characters:

- **\\n:** will add a new line
- **\\t:** will add a tab
- **\\b:** will do a backspace (move one character backward)

Here is an example of a code that uses all these special characters:

``` c
#include <stdio.h>

int main(void)
{
    printf("Hello,\nworl\bd\t!");

    return 0;
}
```
This code will print:
```c
Hello,
word    !
```

## Format specifiers

What if you created a variable and wish to print it to the screen? Well, for that we have the format specifiers! Every datatype has its own format specifier and they are listed here.

- **int:** %d
- **float:** %f
- **double:** %lf
- **long (int):** %l
- **long double:** %Lf
- **char:** %c
- **string:** %s

Let's check a code example to see how to incorporate the format specifier to the `printf();` function:

``` c
#include <stdio.h>

int main(void)
{
    int a = 1;
    float b = 2.356;
    char c = '$';
    char d[] = "Hello";

    /* To print it, we add the format specifier inside the quotation marks, followed by a comma and the variable itself. */
    printf("%d\n", a);
   /*  We can print multiple variables at once too! */
    printf("%f \t %c \n", b, c);
    printf("%c\n", c);
    printf("%s", d);

    return 0;
}
```
This code will print:
```
1
2.356000    $
Hello
```

Notice how our `float` variable displayed with 3 more zeros at the end. If we want to control this decimal precision, all we have to do is add `.n` (n being a number between 1 and 6) after the `%`.

For example:

``` c
#include <stdio.h>

int main(void)
{
    float a = 2.356789;
    printf("%f\t", a);
    printf("%.1f\t\t", a);
    printf("%.3f\t", a);

    return 0;
}
```
This code will display:
```
2.356789	2.4		2.357
```
