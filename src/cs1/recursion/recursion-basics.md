---
title: Intro to Recursion
author:
    - Jacob Gadberry
---

# Introduction

Recursion is a powerful programming concept which allows programmers to develop elegant solutions to seemingly complex problems. If you've never heard of recursion before; simply, it's a function that calls itself. 

## Simple Example

Let's consider a classic example that is used to teach recursion: Factorial!

The factorial of any non-negative integer, `n`, usually written as `n!`, is defined as the product of all the positive-integers less than or equal to `n`.

`n! = n * (n-1) * (n-2) * ... * 3 * 2 * 1`

Let's consider writing an iterative solution to this problem. This would the solution someone who hasn't encountered recursion before would probably come up with:

``` c
    // Perform the product from 1 to n
    for(int i = n; i >= 1; i--){
        ans *= i;
    }
    // Display the answer
    printf("%d ",ans);
```

The key to utilizing recursive solutions to problems is answering one key question: "Can the problem I'm solving be broken into smaller sub-problems of the same type?"

Notice for our simple Factorial program, we only do simple multiplication for each iteration `ans *= i`.

## Formulating a Recursive Solution

When creating a recursive solution we need to consider how we can create the smaller sub-problems. When computing the factorial, notice at each iteration we are simply multiplying the number we are at ,`n`, with whatever factorial of `n-1` is. 

Lets write a function body along with the logic I just described

```c
int fact(int n){
    return n * factorial(n-1);
}
```

## Generating a Base Case

Sweet! We are all done... or are we? There is a key piece of code that I have forgot to add. Can you figure out what it is? 

If you call `fact(5)` in `main()`, nothing will happen. This happens because an infinite loop has occurred.

Why?

Well let's trace through `fact(5)`

> When things don't work like intended, it is always helpful to run a debugger, like GDB, which is extremely useful to show the steps your code took during execution. WikiKnights has tutorials on using GDB if you are interested.


Tracing the function calls: 
```
                    fact(5) = 5 * fact(4)
                    fact(4) = 4 * fact(3)
                    fact(3) = 3 * fact(2)
                    fact(2) = 2 * fact(1)
                    fact(1) = 1 * fact(0)
                            .
                            .
                            .
```

This issue highlights another key pillar of recursive solutions: base cases. A base case is a case in our recursive solution that is trivially easy to solve. Because of this, we can simply return the answer to problem, this also ensures that our recursive calls end. For Factorial this base case will be `fact(0)`, since `0! = 1`.

Now, lets add a base case to our code and see if it works

```c
int fact(int n){
    //Base Case: n == 0 
    if(n == 0){
        return 1;
    }
    //Recursive Case: n > 0
    else{
        return n * fact(n-1);
    }
}
```

## General Form of Recursive Solutions

If we analyze the structure of our recursive solution to the factorial, we will notice a few things:

```c
 //Base case
 if(terminating condition){
    //Return the trivially easy answer
 }
 //Recursive case
 else{
    //Slightly solve and recursively call the function again
 }

```
1) We have a base case condition to see if we found a trivially easy problem. This will help terminate the recursive calls (Remember what happened when we didn't have this before).
2) We have a second conditional that recursively calls the same function again but with a smaller input. Also notice how we solve the problem slightly in some sense. For our factorial this involves us multiplying `n` by `factorial(n-1)`.

While all problems might not have this simple layout, it is a good foundation to start with in your journey of learning recursion.

## Try a Problem Yourself

Given a positive integer `n`, return the sum of the digits of `n`. For example `123` would return `6` because `1 + 2 + 3 = 6`.

Given the function header, write a recursive solution to this problem.

```c
int sumDigits(int n){
    // You write this
}
```
## Conclusion

As we've learned, recursion is an incredibly powerful programming technique that can be used to solve many different types of problems. Understanding and utilizing recursion is a skill, which implies some practice is needed to hone.  Recursion is also an important programming concept that integral to many different data structures and algorithms you will cover in Computer Science I. Because of this, it is important to take the time to practice utilizing recursion in different types of problems.

## Additional Resources

[William Fiset Recursion Playlist](https://youtube.com/playlist?list=PLDV1Zeh2NRsCmu1lb9grUcljeYJtmgmYc&si=ZCzm6PNRa7iZw1bV)

[Introduction to Recursion](https://www.geeksforgeeks.org/introduction-to-recursion-data-structure-and-algorithm-tutorials/)

[5 Simple Steps for Solving Any Recursive Problem](https://www.youtube.com/watch?v=ngCos392W4w)

[MIT OpenCourseWare Recursion](https://ocw.mit.edu/ans7870/6/6.005/s16/classes/10-recursion/)

## Credits

Thanks to professor Arup Guha, as this tutorial is an adaptation of his class notes. If you would like to view them click [here](https://www.cs.ucf.edu/~dmarino/ucf/transparency/cop3502/lec/RecursionIntro.pdf).