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
If this loop goes through these operations $n$ times, we can call this order $n$ time complexity, or $O(n)$. This is called big-O notation, and is a useful way of classifying the
speed of our code. An example of this is below:

``` c
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

Let us say now that this loop is also surrounded by another loop that goes through $n$ times. This causes the time complexity to increase to order $n^2$, which would be $O(n^2)$ in big-O notation. An example of this is below:

``` c
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

There are many different time complexity classifications, from some of the largest being $O(n!)$ or $O(n^n)$, to the smallest being $O(nlog(n))$ or $O(1)$, in which $O(1)$ happens in constant time (Ex: no loops). In this section, we will deal primarily with $O(nlog(n))$ and $O(n^2)$ time complexities.

# Sorting Algorithms

There are many different sorting algorithms, some of which could be made entirely as a joke, where others are made to compete to be the most efficient algorithm to sort. A common sorting problem is that of sorting an array of integers. Below is a list of the most common sorting algorithms, those with a star next time are the ones that will have code written and an explanation in this section.

Sorting Algorithms    Time Complexity
-------------------   ----------------
Bubble Sort *\**      $O(n^2)$
Selection Sort *\**   $O(n^2)$
Insertion Sort *\**   $O(n^2)$
Merge Sort            $O(nlog(n))$
Heap Sort             $O(nlog(n))$
Quick Sort            $O(nlog(n))$

The faster ways to sort, Merge, Heap, and Quick Sort are very useful and quick! However, we will not be going over these sorting methods in this section and you are encouraged to go over these in your own time to learn what makes them so fast and effective.

## Bubble Sort

Bubble Sort works by iterating through the array multiple times to sort the numbers one at a time. The way it does this is by checking the element in position $i$ where $i>=0$ and $i<n$, with $n$ being the size of the array. It compares this element with that in position $i+1$, in a sorted array the element to the right would be the greater number. If this isn't the case, Bubble Sort will swap these two numbers to make sure that it IS the case. Effectively, with one full iteration of the array, the largest number will be in the last slot. After another iteration of the whole array, the second largest will be in the second to last slot. The pattern continues until every integer is in its correct slot, which takes at most $n$ times if there are $n$ integers not in their sorted slot. This can be achieved in the code below.

``` c
#include <stdio.h>

int main(void){
    int arr[] = {61, 3, 30, 12, 45, 9, 90, 99, 1, 24};
    int n = 10; // Size of the array is 10

    printf("Array before Bubble Sort:\n");
    for(int i = 0; i < n; i++){
        printf("%d ", arr[i]);
    }
    printf("\n");

    for(int i = 0; i < (n-1); i++){
        for(int j = 0; j < (n-i-1); j++){
            if(arr[j] > arr[j+1]){
                int temp = arr[j];
                arr[j] = arr[j+1];
                arr[j+1] = temp;
            }
        }
    }

    printf("Array after Bubble Sort:\n");
    for(int i = 0; i < n; i++){
        printf("%d ", arr[i]);
    }
    printf("\n");

    return 0;
}
```

## Selection Sort

Selection Sort works similarly to Bubble Sort but in the opposite manner. Instead of attempting to put the largest integer in the last slot first, it attempts to put the smallest integer in the first slot. It does this one at a time, so in the first iteration, it will find the minimum number in the array, and saves its index. It will then swap this number with the number in slot $i=0$ (as it is the first iteration, $i$ is $0$). It continues this trend for every slot in the array, until every single number is sorted. An important aspect of Selection Sort is that we are only looking for the minimum number in the slots that have not been corrected, as those do not need to be looked at. So after we fill the correct minimum number in slot $0$, we now are only looking forward from $1$ and beyond. This can be achieved in the code below.

``` c
#include <stdio.h>

int main(void){
    int arr[] = {61, 3, 30, 12, 45, 9, 90, 99, 1, 24};
    int n = 10; // Size of the array is 10

    printf("Array before Selection Sort:\n");
    for(int i = 0; i < n; i++){
        printf("%d ", arr[i]);
    }
    printf("\n");

    for(int i = 0; i < (n-1); i++){

        int minIdx = i;

        for(int j = (i+1); j < n; j++){
            if(arr[minIdx] > arr[j]){
                minIdx = j;
            }
        }

        if(arr[minIdx] != i){
            int temp = arr[minIdx];
            arr[minIdx] = arr[i];
            arr[i] = temp;
        }

    }

    printf("Array after Selection Sort:\n");
    for(int i = 0; i < n; i++){
        printf("%d ", arr[i]);
    }
    printf("\n");

    return 0;
}
```

## Insertion Sort

Insertion Sort is a much more different algorithm than either Bubble or Selection Sort. It is definitely more intuitive, but it performs at the same speed. The way that Insertion Sort works is by moving left to right, and when an element is out of order, we bring it to its order on our left side. For example, we start by just comparing the first two elements. If they are not in order, swap them, otherwise move to the next two. If the next two are not in order, we must swap them so they are, we then check the newly swaped integer to see if it is also in order with the first element, and swap accordingly. Basically, we bring each element to its spot in the sorted array one at a time left to right. This array builds up onto itself until it is fully sorted. Take a look at the example below, try tracing it to see how it works!


``` c
#include <stdio.h>

int main(void){
    int arr[] = {61, 3, 30, 12, 45, 9, 90, 99, 1, 24};
    int n = 10; // Size of the array is 10

    printf("Array before Insertion Sort:\n");
    for(int i = 0; i < n; i++){
        printf("%d ", arr[i]);
    }
    printf("\n");

    for(int i = 1; i < n; i++){

        int curValue = arr[i];
        int j = i - 1;

        while(arr[j] > curValue && j >= 0){
            arr[j+1] = arr[j];
            j--;
        }

        arr[j+1] = curValue;

    }

    printf("Array after Insertion Sort:\n");
    for(int i = 0; i < n; i++){
        printf("%d ", arr[i]);
    }
    printf("\n");

    return 0;
}
```