# Arithmetic Operators Practice (Solutions)

A fun thing to do in these exercises is to create a separate function and call it in main. That way, you can have your own library of functions and reuse it if you need.

1. Write a function that takes 5 numbers and returns the sum and average (in two decimal places) of them.
**Answer:**
```c
#include <stdio.h>

int sum(int v, int w, int x, int y, int z);
float average(int v, int w, int x, int y, int z);

int main (void) {
    long int a, b, c, d, e;

    // prompt user
    printf("Please enter five integers.\n");
    // getting the numbers
    scanf("%ld %ld %ld %ld %ld", &a, &b, &c, &d, &e);

    // printing
    printf("The sum of the numbers you entered is: %d\n", sum(a,b,c,d,e));

    printf("The average is: %.2f\n", average(a,b,c,d,e));

    return 0;
}

int sum(int v, int w, int x, int y, int z) {
    // adding all of them
    return v+w+x+y+z;
}

float average(int v, int w, int x, int y, int z) {
    // the average is giving by the sum of all terms / number of all terms
    // so we use our sum function and then divide by 5, but since we need the decimals, we need to cast to a float
    return (float) sum(v,w,x,y,z) / 5;
}
```

2. Write a function that receives a number and returns whether it is even or odd.
**Answer:**
```c
#include <stdio.h>

void isEven(int x);

int main (void) {
    int a;

    // prompt user
    printf("Please enter an integer\n");

    // getting the number
    scanf("%d", &a);

    // calling the function that will print for us
    isEven(a);

    return 0;
}

void isEven(int x) {
    // when the number is even, the remainder of the division by 2 is 0
    if(x%2 == 0){
        printf("The number is even.\n");
    } else {
        printf("The number is odd.\n");
    }
}
```

3. Write a function that receives a number and returns if the number is divisible by 3.
**Answer:**
```c
#include <stdio.h>

void isDivisibleBy3(int x);

int main (void) {
    int a;

    // prompt user
    printf("Please enter an integer\n");

    // getting the number
    scanf("%d", &a);

    // calling the function that will print for us
    isDivisibleBy3(a);

    return 0;
}

void isDivisibleBy3(int x) {
    // when the number is divisible by 3, the remainder of the division by 3 is 0
    if(x%3 == 0){
        printf("The number is divisible by 3.\n");
    } else {
        printf("The number is not divisible by 3.\n");
    }
}
```

4. Write a function that takes two numbers and returns which one is higher.
**Answer:**
```c
#include <stdio.h>

int findHighest(int x, int y);

int main (void) {
    int a, b;

    // prompt user
    printf("Please enter two integers\n");

    // getting the numbers
    scanf("%d %d", &a, &b);

    // printing
    printf("The highest number is %d\n", findHighest(a,b));

    return 0;
}

int findHighest(int x, int y) {
    // compare which one is bigger
    if(x > y) {
        return x;
    } 
    return y;
}

```

5. Write a function that takes three numbers, the sides of a triangle and returns whether the triangle formed by the given sides is equilateral, isosceles, or scalene.
**Answer:**
```c
#include <stdio.h>

void checkTriangle(int x, int y, int z);

int main (void) {
    int a, b, c;

    // prompt user
    printf("Please enter three integers\n");

    // getting the numbers
    scanf("%d %d %d", &a, &b, &c);

    // printing
    checkTriangle(a, b, c);

    return 0;
}

void checkTriangle(int x, int y, int z) {
    // an equilateral triangle has all equal sides
    if (x == y && y == z ) {
        printf("Equilateral Triangle\n");
    } // an isosceles triangle has 2 equal sides
    else if (x == y || y == z || z == x ) {
        printf("Isosceles Triangle\n");
    } // a scalene triangle has all different sides
    else {
        printf("Scalene triangle\n");
    }
}
```
