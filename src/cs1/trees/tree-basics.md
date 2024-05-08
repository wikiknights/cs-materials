---
title: Intro to Binary Trees
author:
    - Jacob Gadberry
---

# Introduction

Another useful data structure that we will discuss in COP 3502 is Trees. In COP 3502 you will focus on a couple of different type of trees: Binary Trees, Binary Search Trees, AVL Trees, Tries, and Heaps. Let's start with the simplest tree we will discuss: a Binary Tree. 

## Why Trees?

If we look back at Linked Lists, what made them useful compared to array? It was easier to add more items since we could simply attach a new node to the Linked List where ever we wanted. What was a drawback? It took more time to find an item in our Linked List, assuming items were stored in an ordered fashion, because we couldn't index into it. Remember at worst we had an `O(n)` runtime to search.

Trees allow us to have a linked data structure (easy to add items), and allow us to structure our data in a way where it is easier to find, add, and delete items.

Here is an picture of what a binary tree might look like
```
                    +-------+
                    |   A   |
                    +-------+
                  /           \
        +-------+               +-------+           
        |   B   |               |   C   |
        +-------+               +-------+
      /           \           /          \
    X          +-------+     X            X
               |   D   |
               +-------+
             /           \
            X            X
```

# Defining the Binary Tree in code

Before we do anything with binary trees, we first need to set up a way to represent them in C. As the word binary implies, each node in the tree can have a max of two children. To keep track of the children, each node will contain two pointers, `left` and `right`. Each node will store some sort of data; this could be an `int`, `char`, `char*`, or another struct you create. Lastly, a property ALL Trees share is that there are no cycles allowed. If node A points to node B, and node B points to node A, then there is a cycle. 

```c
typedef struct node{
    struct node* left;
    struct node* right;
    int val; //NOTE: Any kind of information can be stored here
}node;
```

# Traversing a Binary Tree

Now that we have a Binary Tree constructed we need a way to search for items within our new data structure. How should we traverse the tree? 

An iterative approach in this situation will be quite difficult since there is no easy we to keep track of paths we've traversed. Can you think of a better way?

One thing that is really useful about Trees is that they are recursive in nature. The left and right sub-trees are really just smaller version of the main tree from which they come. Because of this fact, we can utilize recursion to traverse through a Binary Tree.

To get an intuition of how we could traverse a Binary Tree, think about how could we write code to print out all of the values of the nodes within a given Binary Tree.

```
                    +-------+
                    |   A   |
                    +-------+
                  /           \
        +-------+               +-------+           
        |   B   |               |   C   |
        +-------+               +-------+
      /           \           /          \
    X          +-------+     X            X
               |   D   |
               +-------+
             /           \
            X            X
```

Taking this tree for example, how could we write code to print all of the values within it?

<details>
<summary>Show Code</summary>

One way we could do this is as follows; print the value of the node we are at, then print the left and right subtrees. Print the value of one of the other subtrees and then the node we are at. Print the values of both of the subtrees then print the node we are at.

The code could look something like this

```c
void printTree(treeNode* root){
  if(root == NULL)
    return;
  //Print the node we are at first
  printf("%d", root->data);
  //Print both of the subtrees of root
  printTree(root->left);
  printTree(root->right);
}
```

Can you come up with the other two mentioned above?
</details>

Looking back at the different ways at printing the values within our tree we can derive three main ways to traverse a binary tree: Pre-order, In-order, Post-order. Pre-order is printing the value we are at first; In-order is printing on our subtrees first; and, post-order is printing both of our subtrees first. Lets look at the code!

```c
//Print the data first
void PreOrder(treeNode* root){
	if(root == NULL)
		return;
	//Pre means data first
	printf("%d ", root->data);
	PreOrder(root->left);
	PreOrder(root->right);
}
//Print the data second
void InOrder(treeNode* root){
	if(root == NULL)
		return;
	InOrder(root->left);
	//In means data in the middle
	printf("%d ", root->data);
	InOrder(root->right);
}
//Print the data last
void PostOrder(treeNode* root){
	if(root == NULL)
		return;
	PostOrder(root->left);
	PostOrder(root->right);
	//Post means data at the end
	printf("%d ", root->data);

}
```

Can you determine the Pre-order, In-order, and Post-order of this Binary Tree?

```
                    +-------+
                    |   A   |
                    +-------+
                  /           \
        +-------+               +-------+           
        |   B   |               |   C   |
        +-------+               +-------+
      /           \           /          \
    X          +-------+     X            X
               |   D   |
               +-------+
             /           \
            X            X
```

# Conclusion

 We've learned that binary trees are linked structures that allow us to store our data is a different way. We also studied different ways to traverse our new data structure. It is important to make sure that you understand the information discussed here, as having a strong understanding of the basics will allow you to do good in Computer Science I.

# Additional Resources

[Binary Tree Bootcamp: Full, Complete, & Perfect Trees. Preorder, Inorder, & Postorder Traversal.](https://www.youtube.com/watch?v=BHB0B1jFKQc&t=1033s)

[MIT OpenCourseWare Binary Trees](https://ocw.mit.edu/courses/6-006-introduction-to-algorithms-spring-2020/resources/lecture-6-binary-trees-part-1/)

[Introduction to Binary Tree – Data Structure and Algorithm Tutorials](https://www.geeksforgeeks.org/introduction-to-binary-tree-data-structure-and-algorithm-tutorials/)

# Credits

Thanks to professor Arup Guha, as this tutorial is an adaptation of his class notes. If you would like to view them click [here](https://www.cs.ucf.edu/~dmarino/ucf/transparency/cop3502/). Once on the main site, click `Study Materials`, then go to `Binary Trees`. There will be all of his notes on this topic.