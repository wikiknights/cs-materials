---
title: Recursion Practice (Answers)
author:
  - Jacob Gadberry
toc: false
---

@. Given a positive integer `n`, return the sum of the digits of `n`. For example `123` would return `6` because `1 + 2 + 3 = 6`.

**Answer**:

```c
int sumDigits(int n){
   //The sum of a one digit number is simply the number itself
   if(n < 10){
    return n;
   }
   //Isolate one of the digits to build part of our sum
   else{
    return (n%10) + sumDigits(n/10);
   }
}

```

Here we sum the digits of a positive integer `n`.

Here `n % 10` takes n and completes the modulus operation. Modulus, `%`, calculates the remainder when one number, `p`, is divided by another number, `q`. Here `n % 10` essentially pulls out the digit in the 1's place. Once we have pulled the digit out of the 1's place, we need to sum the rest of the digits in n. `sumDigits(n/10)` is our recursive call and calculates the sum of the rest of the digits in n.

@. The Lucas numbers are similar to Fibonacci numbers, you can calculate them based off the previous two calculated numbers. Write a program that calculates the `n'th` Lucas number. Learn more about Lucas numbers [here](https://brilliant.org/wiki/lucas-numbers/).

**Answer**:

```c
   int lucas(int n){
    //0'th Lucas number is 2
    if(n == 0)
        return 2;
    //1st Lucas number is 1
    if(n == 1)
        return 1;
    //Recursive case
    else
      return lucas(n-1) + lucas(n-2);
}
```

Unlike our previous example, we have two different base cases. The reason for this comes from the fact that there are two initial Lucas numbers: `0` and `1`. To handle this, we write two `if` statements to detect when we've reached `lucas(1)` and `lucas(0)`, and since those are trivially easy to solve, we just return the answer.
