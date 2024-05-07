---
title: Binary Search Trees 
author:
  - Jacob Gadberry 
---

# Introduction

Binary Search Trees (BST) give us a data structure that will allow us to store data in a strategic way to make searching for data quicker than just a simple `O(n)` linear search.

# Binary Search Tree

With regular Binary Trees we did not define a way of placing values into the tree. This makes it harder to search for values since we have no way of knowing where they lie within the Binary Tree. If we think about it, a search on a Binary Tree with data placed arbitrarily will still do no better than a Linked List search, `O(n)`. Think about why this is.

Building off of what we've discussed, we will add another property to our Binary Tree: any data less than the root will be placed in the left subtree and any value greater than or equal to the root will go in the right subtree. 

Here is an example of a BST:
```
                    +--------+
                    |   10   |
                    +--------+
                  /           \
        +-------+               +--------+           
        |   5   |               |   15   |
        +-------+               +--------+
      /           \           /           \
    X          +-------+     X        +--------+
               |   9   |              |   20   |
               +-------+              +--------+
             /           \           /          \
            X            X          X            X
```

Now we have a data structure where we've placed values in a way where we can perform a more clever search that can help improve the worst case runtime from our regular Binary Tree.

# Running a Search on a Binary Search Tree

Now that we have defined what a BST is, let's consider running search on the BST above.

Let's look for `9`; and consider how we could devise some code to search for `9` on this BST. It's important to state that we ALWAYS start our search at the root of the tree `10`.

```
                    +--------+    
                    |   10   |  <---
                    +--------+
                   /          \
```

Since we are searching for `9` and we are currently looking at `10` we can safely look into the left subtree since we know that `9` must be in the left subtree since ALL values less than `10` will reside in the left subtree.

```
                    +-------+    
                    |   5   |   <---
                    +-------+
                   /          \
```

`9` is greater than `5` so we will need to look in `5`'s right subtree to find it.

```
                    +-------+    
                    |   9   |   <---
                    +-------+
                   /          \
```

Great! Now we have found the `9`, the value we were looking for.

Let's run another search. This time let's look for `25`

```
                    +--------+    
                    |   10   |    <---
                    +--------+
                   /          \
```

Since `25` is greater than `10`, we will need to search the right subtree.

```
                    +--------+    
                    |   15   |    <---
                    +--------+
                   /          \
```

`25` is greater than `15`, so we search the right subtree.

```
                    +--------+    
                    |   20   |    <---
                    +--------+
                   /          \
```

`25` is greater than `20`, so we search the right subtree.

```
                    +-------+    
                    |   X   |     <---
                    +-------+
```

Now we have hit a `NULL` node, which must mean that `25` is not in our BST.

# Search in Code

Now that we have traced through an example, lets write some code to do the search. Remember that Binary Trees are recursive in nature, so a lot of our code will also be recursive.

```c
int search(treeNode* root, int val){
  if(root == NULL){
    return 0; // Return an int that represents an unsuccessful search
  }
  // We have to search the left subtree
  if(val < root->data){
    return search(root->left ,val);
  }
  // We have to search the right subtree
  else if(val > root->data){
    return search(root->right, val);
  }
  //If val isn't greater or less than, it must be equal to root
  else{
    return 1; // Return an int that represents a successful search
  }
}
```

## Height of a Binary Tree

Before we discuss the worst runtime of the search on a BST, we must first understand what the height of a tree is. The height of a Binary Tree is the longest path from root to leaf.

Let's look back at our tree and calculate the height

```
                    +--------+
                    |   10   |
                    +--------+
                  /           \
        +-------+               +--------+           
        |   5   |               |   15   |
        +-------+               +--------+
      /           \           /           \
    X          +-------+     X        +--------+
               |   9   |              |   20   |
               +-------+              +--------+
             /           \           /          \
            X            X          X            X
```

Starting at the root, we will count the number of *edges*. The longest sequence of edges will be the height of our Binary Tree. It is important to note that we DON'T count the edges pointing to `NULL`.

`10 -> 15 -> 20` gives us 2 edges. Likewise, `10 -> 5 -> 9` also gives us 2 edges. Therefore, we say that this tree has a height of `2`.

# Runtime Analysis

What would the worst runtime of this search algorithm be? 

Unlike our search on a regular Binary Tree, which was `O(n)`, this search will be based on the height on the , `h`. So, we say that the worst case runtime of this algorithm will be `O(h)`.

The `O(h)` comes from the fact that we could have to go down the longest branch in the tree to find the value we are looking for. We also remember that the length of the longest branch in a tree is defined as the height of the tree. Therefore, in the worst case we will traverse AT MOST `h + 1` nodes within the tree before we can determine if the value is in the tree or not.

Here is one last question to ponder: Can you construct a BST where the worst case runtime for search could be the same as the worst case search in a Binary Tree? 

# Insertion & Deletion

Now that we have discussed searching in a BST, it would be helpful if we could actually **build** our own BST. We will discuss how we can insert and delete elements from a BST.

## Insert

Insert will be extremely simple since every time we insert a new node into the BST it will ALWAYS be at the leaf-level. Leaf-level being the level where the nodes point to `NULL`.

Whenever we insert a new node into a BST, we follow the same logic as if we were doing a BST search. Once we hit a `NULL` then we can create a new node with the value that we want to add.

Let's take this tree and add the value `1`

```
                    +--------+
                    |   10   |
                    +--------+
                  /           \
        +-------+               +--------+           
        |   5   |               |   15   |
        +-------+               +--------+
      /           \           /           \
    X          +-------+     X        +--------+
               |   9   |              |   20   |
               +-------+              +--------+
             /           \           /          \
            X            X          X            X
```

Once we get here, we will evaluate that `1 < 5`, so we will go left and find a `NULL` node. Once we are here we will create a new node storing `1`

```
                    +-------+
                    |   5   |
                    +-------+
                   /         \
                  X          ...
```
Now our subtree looks like this.

```
                    +-------+
                    |   5   |
                    +-------+
                   /         \
              +-------+      ...
              |   1   |
              +-------+
             /         \
            X           X
```

### Insert in Code

Let's look at the insert code 

```c
	//We've created a new tree!
	if(root==NULL){
		return (makeNode(val));
	}
  //We need to add the node to the left subtree
	if(val<root->data){
		root->left = insert(root->left, val);
	}
  //We need to add the node to the right subtree
	else
		root->right = insert(root->right, val);
	
	//Return the new root of our tree
	return root;
```

## Delete

Unlike inserting into a BST, deleting an element from a BST is a little more complex. The added complexity comes from the fact that we need to determine the number of children a node has because this will determine how we will replace the node. 

Let's look at an example 

```
                    +--------+
                    |   10   |
                    +--------+
                  /           \
        +-------+               +--------+           
        |   5   |               |   15   |
        +-------+               +--------+
      /           \                       \
+-------+     +-------+              +--------+
|   1   |     |   9   |              |   20   |
+-------+     +-------+              +--------+
                                    /
                               +--------+      
                               |   19   |      
                               +--------+      
```

Let's consider deleting `19`. This will be easy since `19` has no children it can simply be deleted.

```
                    +--------+
                    |   10   |
                    +--------+
                  /           \
        +-------+               +--------+           
        |   5   |               |   15   |
        +-------+               +--------+
      /           \                       \
+-------+     +-------+              +--------+
|   1   |     |   9   |              |   20   |
+-------+     +-------+              +--------+
```

Let's try another and delete `15` from our original tree. This will be harder since we cannot delete `15` since it has a child that we don't want to get rid of. What we can do is remember the right subtree of `15` and "patch" it with `10`

```
                          ...
                            \
                              +--------+     
                              |   15   |
                              +--------+
                                        \
                                  +--------+
                                  |   20   |  <-- Remember this
                                  +--------+
                                  /
                            +--------+      
                            |   19   |      
                            +--------+      
```

Now that we've remembered the right subtree, we can delete `15` and set `10` right child to `20`.

```
                    +--------+
                    |   10   |
                    +--------+
                  /           \
        +-------+               +--------+           
        |   5   |               |   20   |
        +-------+               +--------+
      /           \            /          
+-------+     +-------+   +--------+
|   1   |     |   9   |   |   19   |
+-------+     +-------+   +--------+
```

It's important to note that this technique will also work assuming a node only has a left child.

Let's do one more deletion to our original tree, and delete `5`. This becomes more difficult because we now have 2 children to account for. So the question becomes "what do we do?"

Obviously we can't delete `5` and patch over. What we can do is replace the node of `5` with something else.

It turns out that we can replace `5` with `1` or `9` and BST still holds the properties it has to to still be a BST. 

```
                    Replace 5 with 1
                    +--------+            
                    |   10   |
                    +--------+
                  /           \
        +-------+               +--------+           
        |   1   |               |   20   |
        +-------+               +--------+
                 \             /          
              +-------+   +--------+
              |   9   |   |   19   |
              +-------+   +--------+
```

```
                    Replace 5 with 9
                    +--------+
                    |   10   |
                    +--------+
                  /           \
        +-------+               +--------+           
        |   9   |               |   15   |
        +-------+               +--------+
      /                                   \
+-------+                             +--------+
|   1   |                             |   20   |
+-------+                             +--------+
                                    /
                               +--------+      
                               |   19   |      
                               +--------+      
```

It should be noted that, in general, when a node has two children it can either be replaced from the maximum node in its left subtree OR the minimum of its right.

### Delete in Code

Let's look at the delete code

```c
	//There is no node to delete
	if(root == NULL)
		return NULL;
	
	//We've found the correct node to delete
	if(root->data == val){
		//The root has no children (Easy Case)
		if(isLeaf(root)){
			free(root);
			return NULL;
		}
		//The root has only a left child, it will become the new root (Patch over)
		else if(hasOnlyLeftChild(root)){
			treeNode* temp = root->left;
			free(root);
			return temp;
		}
		//The root has only a right child, it will become the new root (Patch over)
		else if(hasOnlyRightChild(root)){
			treeNode* temp = root->right;
			free(root->right);
			return temp;
		}
		//The node has two children
		else{
			//Find the node to swap it with (the min of the right sub-tree)
			treeNode* newDelNode = minVal(root->right);
      //Save the minimum node's value so we can replace it
			int saveValue = newDelNode->data;
			//Actually go and delete the old node (min of the right sub-tree)
			root->right = delete(root->right, saveValue);
			//Set the root equal to the min of the previous right sub-tree
			root->data = saveValue;
			return root;
		}
	}
  //We AREN'T at the correct node, so continue BST search
	else if(val < root->data)
		root->left = delete(root->left, val);
	else
		root->right = delete(root->right, val);
	
	//Now that the delete has occurred, return the new root
	return root;
```

# Conclusion

We've learned about a better way to store data within a recursive tree structure. Doing this takes us a step in the direction of getting a better structure that will allow us to insert and search quickly. Lastly, we've learned how to build our own Binary Search Tree.

# Additional Resources

[Binary Search Tree - GeeksForGeeks](https://www.geeksforgeeks.org/binary-search-tree-data-structure/)

[Calculating the Height of a Binary Tree](https://www.baeldung.com/cs/binary-tree-height)

[DSA Binary Search Trees](https://www.w3schools.com/dsa/dsa_data_binarysearchtrees.php)

[Lecture 5: Binary Search Trees, BST Sort - MIT OCW](https://ocw.mit.edu/courses/6-006-introduction-to-algorithms-fall-2011/resources/lecture-5-binary-search-trees-bst-sort/)

[Binary Search Tree Insertion - William Fiset](https://www.youtube.com/watch?v=LwpLXm3eb6A)

[Binary Search Tree Removal - William Fiset](https://www.youtube.com/watch?v=8K7EO7s_iFE&t=0s)

[Binary Search Tree Visualization - University of San Francisco](https://www.cs.usfca.edu/~galles/visualization/BST.html)

# Credits

Thanks to professor Arup Guha, as this tutorial is an adaptation of his class notes. If you would like to view them click [here](https://www.cs.ucf.edu/~dmarino/ucf/transparency/cop3502/). Once on the main site, click `Study Materials`, then go to `Binary Trees`. There will be all of his notes on this topic.