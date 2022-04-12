# Operators

## Arithmetic Operators
An arithmetic operator performs mathematical operations, the ones we learn in elementary school. 
- **`+`** : addition

- **`-`** : subtraction

- **`*`** : multiplication

- **`/`** : division

- **`%`** : modulus, remainder after division

- **`++`** : increment, increases the value by one

- **`--`** : decrement, decreases the value by one

Let's look at a coding example!
```c
#include <stdio.h>

int main(void)
{
    int a = 11,b = 3, c;
    
    printf("If a = %d and b = %d, then: \n", a,b);
    c = a+b;
    printf("a+b = %d \n",c);
    c = a-b;
    printf("a-b = %d \n",c);
    c = a*b;
    printf("a*b = %d \n",c);
    c = a/b;
    printf("a/b = %d \n",c);
    c = a%b;
    printf("Remainder when a is divided by b = %d \n",c);

    return 0;
}
```
The output of this program will be:
```
If a = 11 and b = 3, then:
a+b = 14 
a-b = 8 
a*b = 33 
a/b = 3 
Remainder when a is divided by b = 2 
```
Note: if you divide 11 by 3 on a calculator, the result will be 3.6666, but since we are working with integers, only 3 is printed.

Let's look at an increment example separately as it can be a little tricky.

```c
#include <stdio.h>

int main(void)
{
    int a = 5;
    printf("a = %d \n", a);
    int b = ++a; // first 'a' becomes 6 and then stored in 'b';
    printf("b = %d \n", b);
    int c = a++; // first 'a' i.e. 6 is stored in 'c' then 'a' becomes 7.
    printf("c = %d \n", c);
    int d = a; // a is now 7 in memory slot d.
    printf("d = %d \n", d);
    printf("a = %d \n", a);

    return 0;
}
```

The output will be:
```
a = 5 
b = 6 
c = 6 
d = 7 
a = 7
```

## Assignment Operators
An assignment operator will assign (shocking! I know) a value to a variable.

- **`=`** : simply assign. B = A
- **`+=`** : adds and assigns. B += A is the same as B = B+A
- **`-=`** : subtracts and assigns. B -= A is the same as B = B - A
- **`*=`** : multiplies and assigns. B *= A is the same as B = B * A
- **`/=`** : divides and assigns. B /= A is the same as B = B / A
- **`%=`** :  takes the modulus and assigns. B %= A is the same as B = B % A

Let's look at an example!
```c
#include <stdio.h>

int main(void)
{
    int a = 5, c;

    c = a;      // c is 5
    printf("c = %d\n", c);
    c += a;     // c is 10 
    printf("c = %d\n", c);
    c -= a;     // c is 5
    printf("c = %d\n", c);
    c *= a;     // c is 25
    printf("c = %d\n", c);
    c /= a;     // c is 5
    printf("c = %d\n", c);
    c %= a;     // c = 0
    printf("c = %d\n", c);

    return 0;
}
```

The output will be:
```
c = 5
c = 10
c = 5
c = 25
c = 5
c = 0
```

## Relational Operators

A relational operator will check the relationship of two values. If the relation is true, it returns 1; if the relation is false, it returns value 0.

- **`==`** : equal to. If the values are equal, it returns 1.
- **`!=`** : not equal to. If the values are NOT equal, it returns 1.
- **`>`** : greater than. If the left value is greater than the right value, it returns 1.
- **`<`** : less than. If the left value is less than the right value, it returns 1.
- **`>=`** : greater than or equal to. If the left value is greater than or equal to the right value, it returns 1.
- **`<=`** : less than or equal to. If the left value is less than or equal to the right value, it returns 1.

Let's take a look at a coding example:

```c
#include <stdio.h>

int main(void)
{
    int a = 3, b = 3, c = 7;

    printf("%d == %d is %d \n", a, b, a == b);
    printf("%d == %d is %d \n", a, c, a == c);
    printf("%d != %d is %d \n", a, b, a != b);
    printf("%d != %d is %d \n", a, c, a != c);
    printf("%d > %d is %d \n", a, b, a > b);
    printf("%d > %d is %d \n", a, c, a > c);
    printf("%d < %d is %d \n", a, b, a < b);
    printf("%d < %d is %d \n", a, c, a < c);
    printf("%d >= %d is %d \n", a, b, a >= b);
    printf("%d >= %d is %d \n", a, c, a >= c);
    printf("%d <= %d is %d \n", a, b, a <= b);
    printf("%d <= %d is %d \n", a, c, a <= c);

    return 0;
}
```

The output is:
```
3 == 3 is 1 
3 == 7 is 0 
3 != 3 is 0 
3 != 7 is 1 
3 > 3 is 0 
3 > 7 is 0 
3 < 3 is 0 
3 < 7 is 1 
3 >= 3 is 1 
3 >= 7 is 0 
3 <= 3 is 1 
3 <= 7 is 1 
```
Remember: 1 is true, 0 is false.

## Logical Operators
A logical operator connects two or more expressions and returns either 0 or 1 depending upon whether the compound expression results true or false. 

- **`&&`** : Logical AND, it is true only if all operands are true
- **`||`** : Logical OR, it is true if either one operand is true
- **`!`** : Logical NOT, it is used to reverse the logical state. If a condition is true, then NOT will make it false.

Let's look at an example:
```c
#include <stdio.h>

int main(void)
{
    int a = 3, b = 3, c = 7, result;

    result = (a == b) && (c > b);
    printf("(a == b) && (c > b) is %d \n", result);

    result = (a == b) && (c < b);
    printf("(a == b) && (c < b) is %d \n", result);

    result = (a == b) || (c < b);
    printf("(a == b) || (c < b) is %d \n", result);

    result = (a != b) || (c < b);
    printf("(a != b) || (c < b) is %d \n", result);

    result = !(a != b);
    printf("!(a != b) is %d \n", result);

    result = !(a == b);
    printf("!(a == b) is %d \n", result);

    return 0;
}
```
The output is
```
(a == b) && (c > b) is 1 // both expressions are true, so the compound expression is true
(a == b) && (c < b) is 0 // the first expression is true but the second is not, so the compound expression is false
(a == b) || (c < b) is 1 // the first expression is true, so the compound expression is true
(a != b) || (c < b) is 0 // both expressions are false, so the compound expression is false
!(a != b) is 1 // a != b will return 0 but since we have the !, then !0 is 1
!(a == b) is 0 // a == b will return 1 but since we have the !, then !1 = 0
```


## Bitwise Operators
Bitwise operators perform bit-level operations. This is not used in intro to C, but it will be a good reference for the future.
- **`&`** : Bitwise AND, copies a bit to the result if it exists in both operands
- **`|`** : Bitwise OR, copies a bit if it exists in either operand.
- **`^`** : Bitwise XOR, copies the bit if it is set in one operand but not both.

So to understand this example, I recommend you have a binary converter opened or if you have taken CDA with Almaki, you will be pretty familiar with binary convertions. 

Let's suppose we have two numbers, a which is equal to 60 and b which is equal to 13. If we convert them to binary, we have that:
```
a = 0011 1100
b = 0000 1101
```
So what these bitwise operators will do is analyze each bit, return 0 or 1 and by doing that to all the 8 bits, we will have a new binary number.

For example:
```
a   = 0011 1100
b   = 0000 1101
---------------
a&b = 0000 1100 // a AND b must be 1 to return 1, if not it returns 0
```
If we convert `a&b` to decimal, we will have 12, which it might be odd if you just look at it as decimals, that is why you need to convert to binary.

```
a   = 0011 1100
b   = 0000 1101
---------------
a|b = 0011 1101 // a OR b must be 1 to return 1, if not it returns 0
```
Converting that will return 61.
```
a   = 0011 1100
b   = 0000 1101
---------------
a^b = 0011 0001 // only a OR b must be 1 to return 1. if both are true/false, then it returns 0
```
Converting to decimal will return 49.

And here's in code:
```c
#include <stdio.h>

int main(void)
{
    int a = 60, b = 13;

    printf("%d \n", a&b);
    printf("%d \n", a|b);
    printf("%d \n", a^b);
    return 0;
}
```
The output is:
```
12 
61 
49 
```
The compiler will not show the binaries, it will return the decimal value.