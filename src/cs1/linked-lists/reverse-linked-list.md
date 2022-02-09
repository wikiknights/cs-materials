# How to Reverse a Linked List Process

*Created by Yohan Hmaiti.*

![](img/reverse-linked-list-overview.png)

Assign left=root (A) and right=root.next (B)

![](img/reverse-linked-list-step-1.png)

Assign temp=right->next; (C)

![](img/reverse-linked-list-step-2.png)

right->next = left (B)

B now points to A. Remember the red arrows are for the reversed list :)

Move left, right and temp to the following node for each one (to the right by 1)!

![](img/reverse-linked-list-step-3.png)

right->next = left (C)

C now points to B!

![](img/reverse-linked-list-step-4.png)

Shift all our nodes by 1 to the right!

![](img/reverse-linked-list-step-5.png)

right->next = left (D)

D now points to C!

![](img/reverse-linked-list-step-6.png)

Shift all the nodes by 1 to the right!

![](img/reverse-linked-list-step-7.png)

right->next = left, so now E now points to D!

![](img/reverse-linked-list-step-8.png)

Then return the root :)!

![](img/reverse-linked-list-step-9.png)
