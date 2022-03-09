# Introduction to Pointers

*Created by Jerrett Longworth in March 2022.*

This is where things start to get really crazy. With the concept of pointers, you are given more power, but it requires great responsibility.

---

## A Look Into a Computer's Memory

To understand what a pointer is, we first need to take a look inside a computer's memory and see how the variables we have been using up to this point are being stored. (*Note:* When discussing memory, consider this to be a simplified version that only uses the fast, volatile RAM on a computer. Additionally, this will use big-endian notation.)

Consider this following soup of data a cross-section of the raw ones and zeroes that your computer has, making up its memory:

```
00100000 00010010 00101100 11101011
11110100 00100001 00111100 01111000
11011011 10110100 11000011 10010100
11101011 10010101 00010101 10011000
01111010 11110110 11110111 01010000
11110010 01101010 10010100 00101100
01101001 01111011 11010111 10100111
10101000 11100011 00001110 11110000
```

Each group of 8 bits is a *byte*, and represents, among other things, the basic measurement of location within a computer's memory.

Let's say that the data from before is at the very beginning of memory: address 0.

```
Address  |  Data
===============================================
      0     00100000 00010010 00101100 11101011
      4     11110100 00100001 00111100 01111000
      8     11011011 10110100 11000011 10010100
     12     11101011 10010101 00010101 10011000
     16     01111010 11110110 11110111 01010000
     20     11110010 01101010 10010100 00101100
     24     01101001 01111011 11010111 10100111
     28     10101000 11100011 00001110 11110000
    ...     ...
```

Notice how for each line, the address increases by 4, and this is because 4 bytes are on each line.

Computers notate where data exists by these addresses, similar to how every house has an address. Let's look at a completely different part of memory, starting at address `0xA570` and have a look around.

(From here on, I'll start writing addresses in hexadecimal (base-16), like how programmers often do.)

```
Address  |  Data
===============================================
    ...     ...
 0xA570     11000110 00101001 11111111 10111010
 0xA574     01000000 01100111 01110001 01010100
 0xA578     00010011 10111011 10000110 00101100
 0xA57C     00100010 10101000 00001000 00011111
 0xA580     10001100 01010010 10100100 11110101
 0xA584     10100100 11111010 00100101 00001100
 0xA588     11111110 00101001 11011001 01010001
 0xA58C     11100001 11100111 11000010 11011011
     ...     ...
```

This is all completely useless information right now, but what if I told you that this happened to be where the program I made is running right now? Here's that program:

``` c
int main(void)
{
  int x = 3;
  return 0;
}
```

Sure, it doesn't do a whole lot, but it does declare the variable `x` with an initial value of 3. Additionally, this variable has to be stored somewhere in the computer's memory. Take a look at that slice of memory from before one more time:

```
Address  |  Data
===============================================
    ...     ...
 0xA570     11000110 00101001 11111111 10111010
 0xA574     01000000 01100111 01110001 01010100
 0xA578     00010011 10111011 10000110 00101100
 0xA57C     00000000 00000000 00000000 00000011
 0xA580     10001100 01010010 10100100 11110101
 0xA584     10100100 11111010 00100101 00001100
 0xA588     11111110 00101001 11011001 01010001
 0xA58C     11100001 11100111 11000010 11011011
     ...     ...
```

It seems that the bits at address `0xA57C` have changed! For the sake of this example, say that the address of the variable `x` is `0xA57C`. This means that any time we change the value of `x`, the bits at this specific location are changed.

This is cool and all, but what does any of this have to do with pointers?

---

## What is a pointer?

A pointer is **the location of a piece of data in memory**.