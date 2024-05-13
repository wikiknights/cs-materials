---
title: Linked List Basics
author:
  - Jacob Gadberry 
---

# Introduction

One of the first, and most basic, data structures that we will learn about in COP 3502 is Linked Lists. This data structure is really useful for a whole host of different problems. Here we will learn about the basics.

# What is a Linked List

A Linked List is exactly what it sounds like, a list where all of the elements are linked together like a chain.

Here is an example of a Linked List

```
+------+
| head |
+------+
+------+    +------+    +-----+    +-----+    +------+
|  10  | -> |  15  | -> |  3  | -> |  1  | -> | NULL |
+------+    +------+    +-----+    +-----+    +------+
```

> `head` is written above `10` to represent that 10 is the head node.


While this might just look like an array IT IS NOT! An array gives us the ability to index into different spots within our array. We cannot do this with Linked List because all of the nodes reside in non-contiguous spots in memory. All of the `->` represent pointers that each node has pointing to the next.

A Linked List are really useful for storing things when the number of items you need to store might not be known. We can also delete nodes pretty easily which allows us to save memory while not wasting it on unused slots like in an array.

# Linked List in Code

```c
typedef struct node{
    struct node* next; // A pointer to the next node
    int data; //NOTE: Any kind of data could go here
}node;
```

Here we don't store the whole list in a data structure when compared to the array; rather we store the individual nodes that compose the list itself.

# Insert

In order to create Linked Lists, we must know how to insert into one. There are three main ways we will learn to insert: insert in front; insert in back; and insert in order.

## Insert in Front

First, we will trace through an example of how we will insert, then we will go over the code.

Let's consider inserting `7` into this list.

```          
+------+
| head |
+------+
+------+    +------+    +-----+    +-----+    +------+
|  10  | -> |  15  | -> |  3  | -> |  1  | -> | NULL |
+------+    +------+    +-----+    +-----+    +------+
```                  

Assuming we have access to the head of this list, all we must do is have `head` point to `7` and `7` point to what `head` originally had.

```
+------+
| head |
+------+
+------+    
|  10  | -> ...
+------+    
    ^
    |         Set 7's next pointer to 10 
    -----         
+-----+ | 
|  7  |-
+-----+
```

```          
+------+
| head |
+------+
+-----+    +------+ 
|  7  | -> |  10  | -> ...   Set 7's next pointer to 10
+-----+    +------+
```                  

Since we have access constant access to the head,  we don't have to do any traversing. This make inserting in the front an `O(1)` operation.

Now let's look at the code

```c
node* addToFront(node* head, int val){
    //Create the new head of the list with the value we want
    node* newHead = makeNode(val);
    newHead->data = val;
    //Set the new head of the list (This is what makes it O(1))
    newHead->next = head;
    //Return the new head of the list
    return newHead;
}
```

## Insert in Back

Now we will cover adding to the back of a Linked List. There will be two different ways that we can insert to the back; one way requires us to utilize a temporary pointer to traverse to the end of the list to add our node, and the other requires we keep track of another node within our list to add in `O(1)` time.

Here we insert `7` to the end of the list with our first method.

We will create a temporary `node*` that will allow us to find the end of the list. Consider what happens if we do not create a temporary pointer. If we use the head to traverse the rest of the list then we will loose the nodes we pass over. This lose of unfreed memory is called a `memory leak`.

Instead, we will create a temporary pointer called `tempHead` which we will use to traverse until the end of the list is reached.

```          

+------+
| head |
+------+
+------+    +------+    +-----+    +-----+    +------+
|  10  | -> |  15  | -> |  3  | -> |  1  | -> | NULL |
+------+    +------+    +-----+    +-----+    +------+
    ^
    |
+----------+
| tempHead |
+----------+
```                  

We then iterate tempHeap until the node we are at has `NULL` next node. Then, we can add the new node to our list. 

```
+-----+       +------+
|  1  | -     | NULL |     1's next node is NULL
+-----+  |    +------+
         |       ^------
         |    +-----+  |
         |--> |  7  | --
              +-----+
```

Once we've identified the last node in the list we simply add our new node to the back of the list. Since we have to traverse the WHOLE list to find the end, this makes this approach take `O(n)` time.

Another way we can insert to back is by having another pointer to the end of the list. Typically we call this node `tail`. Keeping track of `tail` allows us to insert in `O(1)` time.

Let's look at the `O(n)` insert code

```c
node* addToBack(node* head, int val){
    node* tail = makeNode(val);
    tail->data = val;

    node* temp = head;
    //If the head is NULL, then our new node is the head
    if(temp == NULL)
        return tail;
    //Iterate to the end of the list
    while(temp->next !=NULL)
        temp = temp->next;

    temp->next = tail;
    tail->next = NULL;

    //return the head of the new list
    return head;
}
```

Can you come up with the insert using `tail`?

## Insert in Order 

Besides adding either to the front of the back of a list we might want to add items in order. This will require us to add items in the middle of the list. 

This approach will require us to iterate until we find the correct spot to place our new node at.

Let's insert `13` into our list.

```
+------+
| head |
+------+
+------+    +------+    +------+    +------+    +------+
|  10  | -> |  11  | -> |  15  | -> |  18  | -> | NULL |
+------+    +------+    +------+    +------+    +------+
```

What we will need to do is traverse the list until we find the first node that is greater than the value we want to add into our list. Just like add to back, we will need a temporary node in order to traverse over the list.

```
+------+
| head |
+------+
+------+    +------+    +------+    +------+    +------+
|  10  | -> |  11  | -> |  15  | -> |  18  | -> | NULL |
+------+    +------+    +------+    +------+    +------+
    ^
    |
+----------+
| tempHead |
+----------+
```

We can utilize the ability to use `tempHead->next` to check the value in front of us. Once we find the first value that is greater than `13` we know that we make `13` the next pointer of `tempHead`.


```
+------+    +------+    +------+    +------+
|  11  | -> |  15  | -> |  18  | -> | NULL |
+------+    +------+    +------+    +------+
    ^
    |
+----------+
| tempHead |
+----------+
```

Since we know that `tempHead->next` = `15`, we will add `13` into the list 

```
+------+    +------+    +------+    +------+
|  11  | -| |  15  | -> |  18  | -> | NULL |
+------+  | +------+    +------+    +------+
    ^     |      ^
    |     |      |-----     
    |     ------      |
+----------+   |   +------+
| tempHead |   |-> |  13  |
+----------+       +------+
```

We set `13` next value as `15` and then we set `tempHead`'s next value to 13. Now we've inserted `13` in the correct place within the list

It's clear to see that at WORST we might have to traverse the whole list, which makes this an `O(n)` operation.

```c
node* addInOrder(node* head, int val){
    node* toAdd = makeNode(val);
    //We just created a new list
    if(head==NULL)
        return toAdd;
    
    //If the value we want to add is less than the head our new node is the head
    if(val<head->data){
        toAdd->next = head;
        return toAdd;
    }
    //We know now that head must be < val, so we need to continually check temp->next elements
    node* temp = head;
    
    //Find the spot to place our new node
    while(temp->next!=NULL && temp->next->data<val)
        temp = temp->next;
        
    //After this, temp must be greater than our val
    //Inserting toAdd between temp and temp->next
    toAdd->next = temp->next;
    temp->next = toAdd;
    //Return the new head of the list
    return head;
}
```

# Delete

Deleting an element from a Linked List will be a lot like adding in order. We will need to keep track of the node that comes right before the node we want to delete. 

Once we "patch over" the deleted node, then we can free it.

Let's delete `15` from the list

```
+------+
| head |
+------+
+------+    +------+    +------+    +------+    +------+
|  10  | -> |  11  | -> |  15  | -> |  18  | -> | NULL |
+------+    +------+    +------+    +------+    +------+
```

Just like before, we will need a temporary node to traverse the rest of the list. Once we find the node RIGHT BEFORE `15`, then we can perform the "patch over" and deletion of `15`.

```
+------+    +------+    +------+    +------+
|  11  | -> |  15  | -> |  18  | -> | NULL |
+------+    +------+    +------+    +------+
   ^
   |
+----------+
| tempHead |
+----------+
```

Once we are here we will save `15` in another temporary node, then "patch over", then free `15.

```       
          ------------ 
+------+  | +------+ |  +------+    +------+
|  11  | -| |  15  | -> |  18  | -> | NULL |
+------+    +------+    +------+    +------+
   ^            ^
   |            -------
   |                  |
+----------+      +-----------+
| tempHead |      | tempHead2 |
+----------+      +-----------+
```

Now we can call `free(tempHead2)` to safely delete `15`.

Since at WORST we might have to traverse the whole list, this makes delete an `O(n)` operation.

Now let's look at the delete code

```c
node* delNode(node* head, int val){
    //If head is NUll or there is no next node and head contains val, delete it
    if(head==NULL || (head->next == NULL && head->data == val)){
        free(head);
        return NULL;
    }
    
    node* temp = head;
    node* ahead = head->next;
    //If the head contains val, delete it and move the head up by
    //Needs to be fixed to continue removing head if it contains val
    while(head!= NULL && head->data == val){
        temp = head->next;
        ahead = ahead->next;
        free(head);
        head = temp;
    }
    
    while(ahead->next != NULL){
        //If the current node has the value we wanna delete
        if(ahead->data == val){
            //Link the node behind the current to the link in front 
            temp->next = ahead->next;
            free(ahead);
            ahead = temp->next;
        }
        //We didn't find the value we want so move everything up
        else{
            temp = temp->next;
            ahead = ahead->next;
        }
    }
    
    //Check to see if the end of the list contains the value
    if(ahead->data == val){
        temp->next = NULL;
        free(ahead);
    }
    
    return head;
}
```

> This code does deletions for multiple instances of the value that you want to delete from the list.

# Search

Searching in a Linked List is probably the easiest operation to perform since it is just a Linked List traversal.

All we need is, you guessed it, a temporary node so we can search the whole list for the value what we are looking for. Once we find the value we are looking for we can return `1` to indicate a successful search or `0` for an unsuccessful.

```c
int search(node* head, int val){
    //Our temporary pointer
    node* temp = head;

    //Search until we hit the end of the list
    while(temp != NULL){
        //We've found the value we are looking for
        if(temp->data == val)
            return 1;
        //Advance temp to the next node
        temp = temp->next;
    }
    //The search was unsuccessful 
    return 0; 
}
```

Clearly, any linear search will take at WORST `O(n)` time.

# Conclusion

We learned about the basics of Linked Lists. How to build them and how to remove items from them. Lastly, we learned about the Big-Oh time complexities related to all of these operations.

# Additional Resources

[Linked List Data Structure - GeeksForGeeks](https://www.geeksforgeeks.org/data-structures/linked-list/)

[Linked Lists Introduction - William Fiset](https://www.youtube.com/watch?v=-Yn5DU0_-lw)

[2. Data Structures and Dynamic Arrays - MIT OCW](https://www.youtube.com/watch?v=CHhwJjR0mZA)

# Credits

Thanks to professor Arup Guha, as this tutorial is an adaptation of his class notes. If you would like to view them click [here](https://www.cs.ucf.edu/~dmarino/ucf/transparency/cop3502/). Once on the main site, click `Study Materials`, then go to `Linked List`. There will be all of his notes on this topic.