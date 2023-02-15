---
title: Random Introduction
author: Johnson Laguerre
---


# Introduction to Random Number Generation.

Quick--choose a number between 1 and 10! What number did you choose?

Let's say you chose the number 4.

``` c
#include <stdio.h>

int main(void)
{
    int num = 0;

    printf("Choose a number between 1 and 10: ");

    do
    {
      scanf("%d", &num);
    } while (num < 1 || num > 10);

    printf("You chose: %d.\n", num);

    return 0;
}
```

Here, we take user input and store the value 4. However, let's say we were debugging our code and didn't want to keep entering random numbers by hand. Is there anything we could do to save ourselves the effort?

---

## To the rescue: `rand()` and `srand()`.

Thankfully, C supplies us with two functions in `stdlib.h` to help us generate random numbers: `rand()` and `srand()`.

First, we'll look at `rand()`. It can be used to return a random integer between 0 and `RAND_MAX`, a constant that will be at least 32767. You can assign a variable its return value like so:

``` c
#include <stdio.h>
#include <stdlib.h>

int main(void)
{
    //num1 is assigned a value between 0 and RAND_MAX.
    int num1 = rand();

    printf("num1 = %d.\n", num1);

    return 0;
}
```

Pretty neat, huh?

If you want to find out what `RAND_MAX` is on your system, you can use the following code:

``` c
#include <stdio.h>
#include <stdlib.h>

int main(void)
{
    printf("On my system, RAND_MAX is %d.\n", RAND_MAX);

    return 0;
}
```

---

### Returning a random number between 1 and 10.

Let's go back to our opening example.

Remember that we can use the modulus operator, `%`, to return a number between 0 and `n-1`, where `n` is the number we modulo by. Let's perform `rand()` modulo 10 to return a number between 0 and 9.

``` c
//This modulo operation returns a number between 0 and 9.
int random_num = rand() % 10;
```

Now, we can add 1 to the result to bring the value to between 1 and 10.

``` c
//random_num is now between 1 and 10.
random_num += 1;
```

---

### Returning a random number between any two numbers.

Let's take this concept a step further. Say you want to return a number between *any* two numbers. If we use the example above as  a guide, we see that our upper bound was 10 and our lower bound was 1, giving us a range of 10 numbers. We can calculate that using this formula:

``` c
int range = (upper_bound - lower_bound) + 1;
```

If we plug 10 and 1 into their proper places, we see that `range` evaluates to 10.

``` c
int range = (10 - 1) + 1;
```

Now we use what we know to find a different range. I've been feeling pretty lucky today, so I want my lower bound to be 7. Maybe you've been feeling 100 percent on top of things lately, so we'll make our upper bound 100.

``` c
int lower_bound = 7;
int upper_bound = 100;
```

Using the formula above, we see that `range` evaluates to 94.

``` c
int range = (100 - 7) + 1;
```

Next, we modulo `rand()` by `range` to get numbers between 0 and 93.

``` c
int another_random_num = rand() % range;
```

Finally, we add `lower_bound` to the previous result to have our numbers fall between 7 and 100.

``` c
another_random_num += lower_bound;
```

---

## `rand()` and `srand()`: psuedo-random generators.

I have a secret to tell you: the result of `rand()` actually isn't _entirely_ random. Officially, `rand()` and `srand()` are known as "pseudo-random sequence generation functions" . Simply put, that means the output from `rand()` _can_ be predicted if you know its input and underlying algorithm. However, we don't _see_ it taking any input, so where is the input coming from?

Behind the scenes, it is given a positive integer, or `unsigned int`, called a seed to operate on. When you start your program, the seed has a default value of 1. If you use that seed across different program runs, you will generate the same set of random numbers each time.

---

### Seeding `rand()`: the `srand()` function.

This is where `srand()` comes into play. Once you pass `srand()` a seed, `rand()` can use it to generate random numbers.

``` c
//In stdlib.h.

//seed is visible to both rand() and srand(). Its default value is 1.
unsigned int seed = 1;

//Note: This is not the actual algorithm, only a simplified example.
int rand(void)
{
    seed = (seed * 5) + 1;
    return (seed / 2) % 10;
}

void srand(unsigned int your_seed)
{
    //Sets the global seed variable to the your_seed value passed into the function.
    seed = your_seed;
}
```

Now if we return to the main function, we can call `srand()` then `rand()` to see what happens.

``` c
#include <stdio.h>
#include <stdlib.h>

int main(void)
{
    //Declaring and initializing a seed variable.
    int your_seed = 4; 

    //Passing your_seed to srand().
    srand(your_seed);

    //Calling rand() after seeding srand().
    int last_random_num = rand();

    printf("Your random number: %d.\n", last_random_num);

    return 0;
}
```

``` c
//In the background...

//seed starts as 1.
unsigned int seed = 1;

void srand(unsigned int your_seed)
{
    //Reassigns seed using your_seed.
    seed = 4;
}

int rand(void)
{
    //seed evaluates to 21, which is then stored in the global variable.
    seed = (4 * 5) + 1;

    //Returns 0 to the main function. 
    return (21 / 2) % 10;
}
```

<!-- Also mentioned on the "Pre Written Functions (Predefined)" page in the stdlib.h section. -->
It is considered good practice to call `srand()` only **once**, at the start of your program. While useful for predictability, you may not want to use the same seed every time. In that case, pass `time(NULL)` to `srand()` to use the current time as a seed--and don't forget to include `<time.h>`.

``` c
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(void)
{
    //Seeding srand() with the current time.
    srand(time(NULL));

    //Calling rand() after seeding srand().
    int last_random_num = rand();

    printf("Your random number: %d.\n", last_random_num);

    return 0;
}
```

---

## Further Reading

For a summary of these functions, explore the links on [this page from DevDocs](https://devdocs.io/c/numeric/random).

For technical discussion on `rand()` and even better ways to use it, see [this article](https://c-faq.com/lib/rand.931117.html).