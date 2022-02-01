![](Aspose.Words.6261d37f-92c5-4d14-9cba-7e62a7f2b870.001.jpeg)

**general purpose of reversing a LL![](Aspose.Words.6261d37f-92c5-4d14-9cba-7e62a7f2b870.002.png)**

Text

Assign left=root (A) and right=root.next (B)![](Aspose.Words.6261d37f-92c5-4d14-9cba-7e62a7f2b870.003.jpeg)![](Aspose.Words.6261d37f-92c5-4d14-9cba-7e62a7f2b870.004.png)

**Assign temp=right->next; (C)![](Aspose.Words.6261d37f-92c5-4d14-9cba-7e62a7f2b870.005.jpeg)**

**right->next = left → B now points to A**

**Remember the red arrows are for the reversed list :)![](Aspose.Words.6261d37f-92c5-4d14-9cba-7e62a7f2b870.006.png)**

**Move left, right and temp to the following node for each one (to the right by 1)![](Aspose.Words.6261d37f-92c5-4d14-9cba-7e62a7f2b870.007.jpeg)**

**right->next = left → C now points to B![](Aspose.Words.6261d37f-92c5-4d14-9cba-7e62a7f2b870.008.jpeg)**

**Shift all our nodes by 1 to the right![](Aspose.Words.6261d37f-92c5-4d14-9cba-7e62a7f2b870.009.jpeg)**

**right->next = left → D now points to C![](Aspose.Words.6261d37f-92c5-4d14-9cba-7e62a7f2b870.010.jpeg)**

**shift all the nodes by 1 to the right![](Aspose.Words.6261d37f-92c5-4d14-9cba-7e62a7f2b870.011.jpeg)**

**right->next = left so now E now points to D![](Aspose.Words.6261d37f-92c5-4d14-9cba-7e62a7f2b870.012.jpeg)**

Shift left and right 1 step to the right & assign root=left (E)![](Aspose.Words.6261d37f-92c5-4d14-9cba-7e62a7f2b870.013.png)

Then return the root :)![](Aspose.Words.6261d37f-92c5-4d14-9cba-7e62a7f2b870.014.png)
