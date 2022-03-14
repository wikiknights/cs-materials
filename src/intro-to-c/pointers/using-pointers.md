# How to Use Pointers

*Created by Jerrett Longworth in March 2022.*

To use pointers, there are two main operations involved: reference and dereference. After this, we can see how to store pointers and use them throughout programs.

---

## The Reference Operator (`&`)

In C, the reference operator will give the address (also known as its location) of the variable it is attached to.

For example, if you have a variable called `number`, placing an `&` before it, becoming `&number`, gives the *address* of `number`:

``` c
#include <stdio.h>

int main(void)
{
  int number = 5;

  printf("number = %d\n", number);
  printf("&number = %p\n", &number);

  return 0;
}
```

Sample output:
```
number = 5
&number = 0x7fff51831fa4
```

---

## The Dereference Operator (`*`)

The dereference operator is the opposite from the reference operator, which takes the address of a variable and gives the value stored at that location.

For example, if you had an address to an integer called `number_address`, you can get the integer that the address points to with `*number_address`.

``` c
// Assume an integer pointer called number_address exists.

printf("number_address = %p\n", number_address);
printf("*number_address = %d\n", *number_address);
```

Sample output:

```
number_address = 0x7fff51831fa4
*number_address = 5
```

---

## Declaring Pointers

Using the reference and dereference operators is cool, but there is one more piece of the puzzle missing. How can you *store* an address and use it later?