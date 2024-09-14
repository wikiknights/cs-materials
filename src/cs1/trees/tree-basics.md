---
title: Intro to Binary Trees
author:
  - Jacob Gadberry
---

# Introduction

Another useful data structure that we will discuss are trees. We will focus on a couple of different type of trees: binary trees, binary search trees, AVL trees, tries, and heaps. Let's start with the simplest tree we will discuss: a binary tree.

# Why Trees?

If we look back at linked lists, what made them useful compared to array? It was easier to add more items since we could simply attach a new node to the linked list where ever we wanted. What was a drawback? It took more time to find an item in our linked list, assuming items were stored in an ordered fashion, because we couldn't index into it. Remember at worst we had an $O(n)$ runtime to search.

Trees allow us to have a linked data structure (easy to add items), and allow us to structure our data in a way where it is easier to search, add, and delete items.

Here is an picture of what a binary tree might look like.

```text
                                            +-------+
                                            |   A   |
                                            +-------+
                                          /           \
                                +-------+               +-------+
                                |   B   |               |   C   |
                                +-------+               +-------+
                              /           \           /          \
                            X         +-------+      X            X
                                      |   D   |
                                      +-------+
                                    /           \
                                    X            X
```

## Important Terms

We see that `A` has no parent. Because it has no parent, we say that `A` is the `root` of this binary tree. Usually when doing anything with trees, you will likely be given the `root` since it will give us the ability to traverse the tree to look at all of the nodes.

Next, we see that `A` has two edges, `/`, pointing to `B` and `C`. These edges point to the `children` of `A`. As stated earlier, `A` can have at most two children since this is a binary tree. So we say that `B` and `C` are the children of `A`, or `A` is the parent of `B` and `C`.

We see that `C` and `D` have no children. Because of this, we call these nodes `leaf` nodes. They get this name because they look like leaves on a real tree.

Lastly, whenever you see an `X`, this represents a `null` child, meaning there is no child. It is important to note that **all** leaf nodes have no children at all.

# Defining the Binary Tree in code

Before we do anything with binary trees, we first need to set up a way to represent them in C. As the word binary implies, each node in the tree can have a maximum of two children. To keep track of the children, each node will contain two pointers, `left` and `right`. Each node will store some sort of data; this could be an `int`, `char`, `char*`, or another struct you create. Lastly, a property **all** trees share is that there are no cycles allowed. If node A points to node B, and node B points to node A, then there is a cycle.

```c
   typedef struct node{
       struct node* left;
       struct node* right;
       int val; //NOTE: Any kind of information can be stored here
   }node;
```

# Traversing a Binary Tree

Now that we have a binary tree constructed we need a way to search for items within our new data structure. How should we traverse the tree?

An iterative approach in this situation will be quite difficult since there is no easy way to keep track of paths we've traversed. Can you think of a better way?

One thing that is really useful about trees is that they are recursive in nature. The left and right sub-trees are really just smaller versions of the main tree from which they come. Because of this fact, we can utilize recursion to traverse through a binary tree.

To get an intuition of how we could traverse a binary tree, think about how could we write code to print out all of the values of the nodes within a given Binary tree.

```text
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

We've learned that binary trees are linked structures that allow us to store our data is a different way. We also studied different ways to traverse our new data structure. It is important to make sure that you understand the information discussed here, as having a strong understanding of the basics will allow you to delve deeper into more complex tree structures.

## Additional Resources

[Binary Tree Bootcamp: Full, Complete, & Perfect Trees. Preorder, Inorder, & Postorder Traversal.](https://www.youtube.com/watch?v=BHB0B1jFKQc&t=1033s)

[MIT OpenCourseWare Binary Trees](https://ocw.mit.edu/courses/6-006-introduction-to-algorithms-spring-2020/resources/lecture-6-binary-trees-part-1/)

[Introduction to Binary Tree – Data Structure and Algorithm Tutorials](https://www.geeksforgeeks.org/introduction-to-binary-tree-data-structure-and-algorithm-tutorials/)

## Credits

Thanks to professor Arup Guha, as this tutorial is an adaptation of his class notes. If you would like to view them click [here](https://www.cs.ucf.edu/~dmarino/ucf/transparency/cop3502/). Once on the main site, click `Study Materials`, then go to `Binary Trees`. There will be all of his notes on this topic.
