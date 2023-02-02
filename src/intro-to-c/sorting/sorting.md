---
title: Sorting
author:
  - Quinn Barber
---

# Introduction

Sorting is one of the most useful tools in all of programming, without the ability to sort, we lose a great deal of functionality within our code.

What is the best way to sort an array of integers? What about one made up of strings? Luckily for you, we don't have to find out this ourselves, as for decades sorting algorithms
have been discovered and progressively improved up to the point where we are at now! In this lesson, we will go over some of the most common sorting algorithms, as well as
their usefulness to programming!

# Time Complexity

Time complexity is an important concept to understand for sorting algorithms! Each sorting algorithm has its own time complexity which can help identify distinct differences within
the algorithms themselves.

Let us say we have a certain number of operations throughout a singular loop in our code, such as addition, multiplication, conditional statements, printing, etc.
If this loop goes through these operations _*n*_ times, we can call this order _*n*_ time complexity, or O(n). This is called big-O notation, and is a useful way of classifying the
speed of our code. An example of this is below:

```
#include <stdio.h>

int main(void)
{
    int n;
    scanf("%d", &n);
    for(int i = 0; i < n; i++){
        int a = 2;
        a += 3;
        printf("%d", a);
    }
    return 0;
}
```

Let us say now that this loop is also surrounded by another loop that goes through _*n*_ times. This causes the time complexity to increase to order _*n^2*_, which would be O(n^2) in big-O notation. An example of this is below:

```
#include <stdio.h>

int main(void)
{
    int n;
    scanf("%d", &n);

    for(int j = 0; j < n; j++){
        for(int i = 0; i < n; i++){
            int a = 2;
            a += 3;
            printf("%d", a);
        }
    }

    return 0;
}
```

There are many different time complexity classifications, from some of the largest being O(n!) or O(n^n), to the smallest being O(nlog(n)) or O(1), in which O(1) happens in constant time (Ex: no loops). In this section, we will deal primarily with O(nlog(n)) and O(n^2) time complexities.

# Sorting Algorithms

There are many different sorting algorithms, some of which could be made entirely as a joke, where others are made to compete to be the most efficient algorithm to sort. A common sorting problem is that of sorting an array of integers. Below is a list of the most common sorting algorithms, those with a star next time are the ones that will have code written and an explanation in this section.

- Bubble Sort \*
  Time Complexity: O(n^2)
- Selection Sort \*
  Time Complexity: O(n^2)
- Insertion Sort \*
  Time Complexity: O(n^2)
- Merge Sort
  Time Complexity: O(nlog(n))
- Heap Sort
  Time Complexity: O(nlog(n))
- Quick Sort
  Time Complexity: O(nlog(n))

The faster ways to sort, Merge, Heap, and Quick Sort are very useful and quick! However, we will not be going over these sorting methods in this section and you are encouraged to go over these in your own time to learn what makes them so fast and effective.

**Bubble Sort**

Explanation

```
code
```

**Selection Sort**

Explanation

```
code
```

**Insertion Sort**

Explanation

```
code
```
