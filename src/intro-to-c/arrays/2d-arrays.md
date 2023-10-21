---
title: 2D Arrays
author:
  - Bed Pandey
  - Carson Cox
toc: false
---

Remember arrays? Hopefully you do, but here's a very quick refresher:

Arrays represent a collection of items, usually with the same datatype. Here's our array of grades example from before:

```c
float grades[5];
grades[0] = 92.5;
grades[1] = 52.4;
grades[2] = 75.0;
grades[3] = 82.0;
grades[4] = 88.9;
```

```
   grades[0]    grades[1]    grades[2]    grades[3]    grades[4]
+------------+------------+------------+------------+------------+
|    92.5    |    52.4    |    75.0    |    82.0    |    88.9    |
+------------+------------+------------+------------+------------+
```

This specific array, of type `float`, and a size of 5 represents a *one-dimensional* list of grades. A single row, if you will. However, there are some cases where
we might need more than one dimension. Let's say you wanted to represent a grid of some kind, like tic-tac-toe. We *could* just create another one-dimensional array of size 9, but we would have to always keep track of what row and column we're on, since a one-dimensional array only allows us to access the element with just a single index. 

However, what if I told you that C allows you to create multi-dimensional arrays? The main advantage of this, for instance, if we have a two-dimensional array, we can access array elements using their "row" and "column". Take a look:

```c
char tic_tac_toe[3][3]; // create a 3x3 two-dimensional array for tic-tac-toe purposes
```

This creates an empty two-dimensional array, with 3 rows and 3 columns. Labeled is a representation of the grid, with the row indexes and column indexes labeled:

```
             column index
            0      1      2
         +-----+-----+-----+
      0  |     |     |     |
         +-----+-----+-----+
row   1  |     |     |     |
index    +-----+-----+-----+
      2  |     |     |     |
         +-----+-----+-----+
```

Let's say that we want to put an `X` in the bottom left cell:

```c
tic_tac_toe[2][0] = 'X' // set an 'X' in the third row, first column of the 2d array
```

Remember, array indexes start at 0. So although we have three rows and three columns (a 3x3 grid), we must remember to start each index at 0. 