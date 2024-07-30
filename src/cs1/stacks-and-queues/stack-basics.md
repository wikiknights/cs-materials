---
title: Intro to Stacks
author:
  - Jacob Gadberry
---

# Introduction

The next data structure that we will study is called a stack. The stack data structure just represents a stack of things, either primitives or structs that you define. We will learn about how implement stacks and a few of their applications.

# What is a Stack?

According to Don Knuth, a stack is "a linear list for which all insertions and deletions are made at one end of the list." The quote illustrates the `Last in First Out` principle (LIFO) which all stacks follow. The last item placed in the stack will be the first item to be removed.

One thing that is interesting about stacks is that we call them "Abstract Data Types". This is because we only define the behavior of the data structure without describing how it is stored.

# Stack Implementation

The first thing that we should discuss is how to create a stack in C. There are two main ways that we can implement stacks: linked lists and arrays.

## Stack Behavior

There are two main things that a stack can do `push` and `pop`. `push` puts an item on the top of the stack. `pop` removes an item from the top of the stack. Sometimes you might implement `peek`, which returns the item on the top of the stack without removing it.

## Linked List

One way we can implementing a stack is with a linked list. In order to do this we need to recall how to add to the head of a linked list. We can think of the head of the linked list as the top item in our stack.

```
                +-------+    +-------+
                |   a   | -> |   b   | -> ...
                +-------+    +-------+
                    ^
                    |
                  head
```

Now each time we want to add an item to our stack we do 3 things:

1. Create a new a node, call it `x`
2. Set the `x`'s `next` node to `a`
3. Set the head of the linked to `x`

Step 3 in affect sets up our new top item in our stack.

```
        +-------+     +-------+    +-------+
        |   x   | ->  |   a   | -> |   b   | -> ...
        +-------+     +-------+    +-------+
            ^
            |
          head
```

Now that we understanding `push`, completing `pop` is just the opposite.

Since we kept track of the head, and since we have access to the next in the stack, we can simply return the data (or the node itself) in `head` and then set `head` to `head->next`. If you opt for just returning the data in the head node, remember to call `free()` on it so no memory leaks occur.

One of the pros when implementing a stack with a linked list is that you don't have to worry about a fixed length; as you can always add one more node (assuming you don't run out of memory of course). However, with great power comes great responsibility since freeing nodes is now your problem do deal with. Keep these in mind when determining which implementation to go with.

> Can you create `peak` on your own?

## Array

Another way we can implement stacks is with arrays. Here we define an array of size `n`. From here, every time we `push` an element onto the stack we keep track of that index the new top element resides. Each time we `pop` an element, we return the top element and decrement the index of the stack.

Example stack where `n`= 5

```
    0       1       2       3       4
+-------+-------+-------+-------+-------+
|   5   |       |       |       |       |
+-------+-------+-------+-------+-------+
    ^
    |
   head
```

Here there is one item in the stack `5` residing at index 0. If we wanted to `push` 9 onto the stack, we would increase the head by one and then place 9.

```
    0       1       2       3       4
+-------+-------+-------+-------+-------+
|   5   |   9   |       |       |       |
+-------+-------+-------+-------+-------+
            ^
            |
          head
```

If we want to perform a `pop`, we simply keep track of the item at head, then decrement head by 1.

```
    0       1       2       3       4
+-------+-------+-------+-------+-------+
|   5   |   9   |       |       |       |
+-------+-------+-------+-------+-------+
    ^
    |
  head

+---------+
|num =  9 |
+---------+
```

Here we return 9 and move the head pointer down by one.

> It's important to mention that the 9 in the array index 1 is not erased or removed.

# Applications of Stacks

One application where we can use Stacks is when evaluating mathematical expressions in `postfix notation` . In order to understand what `postfix` even means, let's relate it to something you're probably more familiar with.

> If you've heard the phrase "reverse polish notation", that is another way to say `postfix notation`.

When we write `3 + 7 * 5`, we that `7 * 5` should be evaluated first; this gives us `35`. From here we take `35` and and `3` giving us `38` as our final answer.

But, why did `7 * 5` go first? Why not `3 + 7`? Most of us (hopefully) know the answer to this. In elementary school you learned about the order of operations: parenthesis, exponents, multiplication, division, addition, and subtraction (`PEMDAS` mnemonic helps us remember).

"Why would we need this?" Well, when computers perform arithmetic they have no concept of operator precedents like we do. This precedents allows us to remove the ambiguity that arises when we write equations in `infix notation`.

> Think about it, if you didn't have operator precedents could you arrive at one "correct" answer to `3 + 7 * 5`?

## Postfix Evaluation

Given this expression `3 7 5 * +` (the `postfix` equivalent of the expression above), find what it equals.

In order to solve this problem we will use a stack. But how?

What we will do is start with an empty stack and read through our expression. There are two main operations we will do when reading our expression:

1. When we hit a number (operand), we `push` it onto our stack.
2. When we hit an arithmetic symbol (operator), we `pop` two numbers off of the stack an perform that operator on the two numbers; we then push that result onto the stack.

Let's run through this with our original expression `3 7 5 * +`

```
            3 7 5 * +
            ^


  3
-----
Stack
```

```
            3 7 5 * +
              ^

  7
  3
-----
Stack
```

```
            3 7 5 * +
                ^
  5
  7
  3
-----
Stack
```

```
            3 7 5 * +
                  ^

 35
  3
-----      7 * 5 = 35
Stack
```

```
            3 7 5 * +
                    ^


 40
-----      3 + 35 = 40
Stack
```

Now that our stack is empty we know our result is `40`.

We can double check this by computing the answer to the `infix` version.

```
3 + 7 * 5 = 3 + 35 = 40
```

Now, we can conclude that we've come to the correct answer! Yay!

A natural question you might have is "how do we get `postfix` notation in the first place?" The process to get an infix expression into a postfix expression also uses a stack. However, that process takes a little longer to explain and demonstrate, which is why it will have its own tutorial.

We've learned about stacks and how they are abstract data types. This makes them unlike any other data structure we've learned about thus far. We've also learned how to implement stacks with both a linked list and array. Lastly, we learned about some applications of stacks.

## Additional Resources

[Data Structures: Stacks and Queues - HackerRank](https://youtu.be/wjI1WNcIntg)

[Reverse Polish Notation and The Stack - Computerphile](https://youtu.be/7ha78yWRDlE)

## Credits

Donald E. Knuth "The Art of Computer Programming, Vol. 1: Fundamental Algorithms, 3rd Edition"

Thanks to professor Arup Guha, as this tutorial is an adaptation of his class notes. If you would like to view them click [here](https://www.cs.ucf.edu/~dmarino/ucf/transparency/cop3502/). Once on the main site, click `Study Materials`, then go to `Stacks`. There will be all of his notes on this topic.
