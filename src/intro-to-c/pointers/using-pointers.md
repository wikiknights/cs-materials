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