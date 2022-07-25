---
title: Endianness
author: Jerrett Longworth
---

Suppose you have an integer stored in memory with the value `169552957`, or `0x0A1B2C3D` in hexadecimal. Depending on the archetecture of your system, the actual *ordering* of these bytes making up this integer can be different. This difference is the "endianness" of the data in memory.

## Big-endian:
Bytes are stored with the most significant bit **first**.

```
0A1B2C3D

+----+----+----+----+
| 0A | 1B | 2C | 3D |
+----+----+----+----+

Memory address increasing ---->
```


## Little-endian:
Bytes are stored with the most significant bit **last**.

```
0A1B2C3D

+----+----+----+----+
| 3D | 2C | 1B | 0A |
+----+----+----+----+

Memory address increasing ---->
```


## Another example:
Imagine I was storing the number `5` in binary. This could be different in memory depending on its endianness.

`5` in binary is `101`. In a 32-bit integer, it would be padded with zeros like this:

```
00000000 00000000 00000000 00000101
```

(The spaces are for your readability, but in reality there are no gaps in a computer's memory.)


Once represented in memory, it will look like this:

```
Big-endian:
00000000 00000000 00000000 00000101


Little-endian:
00000101 00000000 00000000 00000000
```

Notice how the bytes in the little-endian representation are reversed. They would have the same size and location in memory, but internally, the bytes are arranged differently.

If there were two integers, side-by-side in memory, little-endian does not mean that the entire block of memory is reversed. It means that *specific pieces of data* within memory are reversed. Look, I know it's weird, but I didn't make this up. Check out this example:

```
Storing the integer '5' followed by the integer '69' (nice) in memory:

Big-endian:
00000000 00000000 00000000 00000101 00000000 00000000 00000000 01000101
|               '5'               | |               '69'              |

Little-endian:
00000101 00000000 00000000 00000000 01000101 00000000 00000000 00000000
|               '5'               | |               '69'              |
```
