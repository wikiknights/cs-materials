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

For all of the data types seen before, like `int`, `double`, `char`, and so on, placing an asterisk (`*`) after them indicates a pointer to that respective data type. For example, `int*` represents a pointer to an `int`, and `double*` represents a pointer to a `double`.

*Note: Yes, this can be confusing at first. The same symbol is used for both declaring pointers and the operation for dereferencing pointers.*

With that aside, let's see a trivial example of how a pointer is created:

``` c
#include <stdio.h>

int main(void)
{
  // Recall declaring an integer, then assigning it a value.
  // (This could be done in one line but is done this way for the sake of demonstration.)
  // Assume the address of number is 0xAD40.
  int number;
  number = 5;

  // Just like creating an integer, we can create an integer pointer with int*.
  int* pointer_to_number;

  // We can take the address of number with &number,
  // then simply assign it to pointer_to_number!
  pointer_to_number = &number;

  printf("&number = %p\n", &number);
  printf("pointer_to_number = %p\n\n", pointer_to_number);

  // We can dereference the pointer too!
  printf("number = %d\n", number);
  printf("*pointer_to_number = %d\n", *pointer_to_number);

  return 0;
}
```

Sample output:

```
&number = 0xad40
pointer_to_number = 0xad40

number = 5
*pointer_to_number = 5
```

---

## A Note on Notation

There is an intense and heated debate on how where the `*` should go in a pointer declaration, and there are good reasons for each choice. For these examples here, they will be written as "`int*`", but you may see any of the following variations, which are all valid:

``` c
int* pointer;

int *pointer;

int * pointer;
```

For introducing pointers, this explanation has decided to group the asterisk with the data type since it highlights the fact that the asterisk is a contributing factor to the variable's data type.

In other situations, this can be confusing because of the following line where multiple pointers are declared at once:

``` c
int* pointer1, pointer2, pointer3;

// Or alternatively...
int *pointer1, pointer2, pointer3;
```

At first glance, you may think that `pointer1`, `pointer2`, and `pointer3` are all declared as integer pointers, however this is false. Only `pointer1` is a pointer since it has an asterisk next to it, and `pointer2` and `pointer3` are actually plain integers since they don't have an asterisk. I know, I wish it wasn't this way either.

To make it more clear for those occasions where you want to declare multiple pointers at once, it makes sense to group the asterisk and the variable name together:

``` c
int *pointer1, *pointer2, *pointer3;
```

Some people have also considered a hybrid approach, where the first instance of `*` is grouped with the data type, and the rest are grouped with the variable name:

``` c
int* pointer1, *pointer2, *pointer3;
```

These are all valid, but is important as different coders prefer different styles. Any of these styles are purely for visual understanding and are treated identically once compiled and executed.

---

## Pass-by-Value vs. Pass-by-Reference

This is where the power of pointers starts to come into play! By passing pointers into functions, they can directly use and modify the values pointed to, no longer requiring you to return something!

When passing variables into functions, there are two categories of passing: passing by value and passing by reference. The main difference is simply whether or not you are passing a pointer into a function.

### Pass-by-Value:

What we have seen up to this point is pass-by-value, where a copy of a value is passed into a function:

``` c
#include <stdio.h>

void change_value(int value)
{
  value = 5;
}

int main(void)
{
  int my_value = 18;

  printf("Initial value of my_value: %d\n", my_value);
  change_value(my_value);
  printf("Final value of my_value: %d\n", my_value);

  return 0;
}
```

Sample output:
```
Initial value of my_value: 18
Final value of my_value: 18
```

Nothing new here so far. Notice that since only a copy of `my_value` is passed into `change_value()`, the version in `main()` is not affected.

### Pass-by-Reference:

Pass-by-reference, on the other hand, is where a copy of an address is passed into a function. Let's create a similar function to the one before, but pass a reference to a variable instead:

``` c
#include <stdio.h>

void change_value(int* value)
{
  *value = 5;
}

int main(void)
{
  int my_value = 18;

  printf("Initial value of my_value: %d\n", my_value);
  change_value(&my_value);
  printf("Final value of my_value: %d\n", my_value);

  return 0;
}
```

Sample output:
```
Initial value of my_value: 18
Final value of my_value: 5
```

By passing the *address* of `my_value`, `change_value()` now has direct access to the integer and can do anything it wants with the value!

However, this *is* still a copy, just the copy of an address. See this example attempting to change the address a pointer points to:

``` c
#include <stdio.h>

void change_pointer(int* pointer)
{
  int new_value;
  pointer = &new_value;
}

int main(void)
{
  int my_value = 18;
  int* my_pointer = &my_value;

  printf("Initial value of my_pointer: %p\n", my_pointer);
  change_pointer(my_pointer);
  printf("Final value of my_pointer: %p\n", my_pointer);

  return 0;
}
```

Sample output:
```
Initial value of my_pointer: 0x7ffe390613ac
Final value of my_pointer: 0x7ffe390613ac
```

In this case, `my_pointer` will continue to point to the same location (`&my_value`) within the context of `main()`.