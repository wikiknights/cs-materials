# How to Reverse a Linked List Process

*Created by Yohan Hmaiti and Matthew Gibbons.*

## The Overview
```
Before:

+------+
| Head |
+------+
    |
    v
+-------+    +-------+    +-------+    +-------+    +-------+    +------+
|   1   | -> |   2   | -> |   3   | -> |   4   | -> |   5   | -> | NULL |
+-------+    +-------+    +-------+    +-------+    +-------+    +------+


After:

+------+    +-------+    +-------+    +-------+    +-------+    +-------+
| NULL | <- |   1   | <- |   2   | <- |   3   | <- |   4   | <- |   5   |
+------+    +-------+    +-------+    +-------+    +-------+    +-------+
                                                                    ^
                                                                    |
                                                                 +------+
                                                                 | Head |
                                                                 +------+
```
## The Code

You wake up one morning to yet another program you wrote in your sleep. This time you had a handful of data to put into a linked list. However, due to your slumber, you input the data in reverse order. To save time, you have decided to reverse the linked list, rather than freeing it all and making it fresh. Fortunately, you also happened to write the code that will make it possible. You are a very productive sleeper.

``` c
struct node *current = head;
struct node *previous = NULL;
struct node *temp = NULL;

while(current != NULL)
    {
        temp = current->next;
        current->next = previous;
        previous = current;
        current = temp;
    }
    *head = prev;
``` 
## The Step-by-Step

What a gift! You remembered to store the `next` node in the linked list in `temp` before moving your `next` pointer forward. This means you'll have something that looks like this, before the loop:

```
                    Head/current
       +------+       +-------+       +-------+       +-------+       +-------+       +-------+       +------+
    +->| NULL |<-+    |   A   | ----> |   B   | ----> |   C   | ----> |   D   | ----> |   E   | ----> | NULL |
    |  +------+  |    +-------+       +-------+       +-------+       +-------+       +-------+       +------+
    |            |
 previous      temp
```

And something that looks like this after the first two lines of the loop:

```
    previous      Head/current       temp
    +------+       +-------+       +-------+       +-------+       +-------+       +-------+       +------+
    | NULL | <---- |   A   |       |   B   | ----> |   C   | ----> |   D   | ----> |   E   | ----> | NULL |
    +------+       +-------+       +-------+       +-------+       +-------+       +-------+       +------+

```

These two lines are important. It is important to store your `next` node before you disconnect from it. Had you tried to store it later, you never would have found it, and the remaining linked list would be lost, and memory leaking all over the floor.

The next two lines of the loop will move the `previous` and `current` pointers forward, allowing us to continue reversing the linked list.

```
                 previous/Head    temp/current
    +------+       +-------+       +-------+       +-------+       +-------+       +-------+       +------+
    | NULL | <---- |   A   |       |   B   | ----> |   C   | ----> |   D   | ----> |   E   | ----> | NULL |
    +------+       +-------+       +-------+       +-------+       +-------+       +-------+       +------+

```

This works because there is a moment when `current` and `previous` point to the same node. Our `next` node is safely stored, so we must move `previous` up to `current` first, then `current` up to `temp`.

Our `current` pointer is not `NULL`, so we can continue the loop, which means we will move our `temp` pointer forward one node.

```
                 previous/Head      current          temp
    +------+       +-------+       +-------+       +-------+       +-------+       +-------+       +------+
    | NULL | <---- |   A   |       |   B   | ----> |   C   | ----> |   D   | ----> |   E   | ----> | NULL |
    +------+       +-------+       +-------+       +-------+       +-------+       +-------+       +------+

```

From this point on, it's rinse and repeat. We connect our `current` node to our `previous`, move `previous` up to our old `current`, move `current` forward to `temp`, and `temp` forward to `current->next`.

```
                     Head          previous         current          temp
    +------+       +-------+       +-------+       +-------+       +-------+       +-------+       +------+
    | NULL | <---- |   A   | <---- |   B   |       |   C   | ----> |   D   | ----> |   E   | ----> | NULL |
    +------+       +-------+       +-------+       +-------+       +-------+       +-------+       +------+

```

Another one.

```
                     Head                          previous         current          temp
    +------+       +-------+       +-------+       +-------+       +-------+       +-------+       +------+
    | NULL | <---- |   A   | <---- |   B   | <---- |   C   |       |   D   | ----> |   E   | ----> | NULL |
    +------+       +-------+       +-------+       +-------+       +-------+       +-------+       +------+

```

And another one.

```
                     Head                                          previous         current          temp
    +------+       +-------+       +-------+       +-------+       +-------+       +-------+       +------+
    | NULL | <---- |   A   | <---- |   B   | <---- |   C   | <---- |   D   |       |   E   | ----> | NULL |
    +------+       +-------+       +-------+       +-------+       +-------+       +-------+       +------+

```

`temp` has reached the end of the linked list, but that's fine. We move `previous` and `current` forward one more time.

```
                     Head                                                          previous      temp/current
    +------+       +-------+       +-------+       +-------+       +-------+       +-------+       +------+
    | NULL | <---- |   A   | <---- |   B   | <---- |   C   | <---- |   D   | <---- |   E   |       | NULL |
    +------+       +-------+       +-------+       +-------+       +-------+       +-------+       +------+

```

This is where the loop ends. Looking back at the loop you wrote in your sleep, `current` moves up to `temp` as the final step of the loop, so you never try to dereference a null pointer. The only step left is moving the `head` pointer to `previous`, because it ended on the last node of the linked list.

```
                                                                                     Head       temp/current
    +------+       +-------+       +-------+       +-------+       +-------+       +-------+       +------+
    | NULL | <---- |   A   | <---- |   B   | <---- |   C   | <---- |   D   | <---- |   E   |       | NULL |
    +------+       +-------+       +-------+       +-------+       +-------+       +-------+       +------+

```

You're incredible! You did this all in your sleep. You may want to get a handle on the sleepwalking, though.