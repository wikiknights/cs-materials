<!-- This document serves as an example to see how files are written in markdown.
     The first thing to note is that HTML-style comments (like the one you are in
     the middle of reading right now) are not rendered in the final output, and
     can be used for leaving comments for the sake of development, like
     remembering spots that may need revision later. -->

<!-- This first part here demonstrates a metadata block (in YAML syntax), which just
     indicates the title of the document and its author(s). Note that this block is not
     strictly required, but is useful to keep consistency between documents.
     
     By default, a table of contents is added under the title and author(s). To disable
     this for a specific page, add the line "toc: false" in the metadata block. -->

---
title: Sample Document
author:
  - Old McDonald
  - Ash Ketchum
---

<!-- Now it is time to begin your document! Let's start with a heading! There are 6 different
     levels of headings available, with the first-level heading being the largest, and the
     sixth-level heading being the smallest. Something important to note is that headings must
     have an empty line before and after them, or there may be strange behavior with the
     surrounding lines of text.-->

# Basic Formatting

<!-- Let's try some basic-ish markdown. Notice that underlined text is not native to markdown,
     but we can still use it with the addition of HTML tags! Lists also have an empty line
     before them to render properly in all places. -->

Hello! This is my document! We can have all kinds of styles to use! Here is a list of some styles,
and different ways to write them! See the source file to find out exactly how it works!

This is a second paragraph.

- **Bold text**
- __Bold text__
- *Italic text*
- _Italic text_
- ***Bold and italic text***
- **_Bold and italic text_**
- __*Bold and italic text*__
- <span class="underline">Underlined text</span>
- ~~Strikethrough text~~

My favorite fruits (best to worst):

1. Bananas
2. Apples
3. Grapes

# Blockquotes

<!-- Blockquotes can be added, even with multiple paragraphs! -->

> Fun fact: "All your base are belong to us" is an Internet meme based on a badly translated phrase from the opening cutscene of the video game Zero Wing.
>
> \- Wikipedia

<!-- Blockquotes can also be nested! -->

> Dorothy followed her through many of the beautiful rooms in her castle.
>
>> The Witch bade her clean the pots and kettles and sweep the floor and keep the fire fed with wood.
>>
>>> Dorothy went to work meekly, with her mind made up to work as hard as she could; for she was glad the Wicked Witch had decided not to kill her.
>>>
>>>> With Dorothy hard at work, the Witch thought she would go into the courtyard and harness the Cowardly Lion like a horse.


# Paragraphs in Lists

<!-- What if you want a list with multiple paragraphs on each bullet point? To do this, just add four
     spaces or a tab at the beginning of the line. The same rules of starting new paragraphs apply here,
     so new paragraphs will need to have an empty new line before and after them. -->

- This is a normal list item.

- This is a list item... but now I will add a second paragraph.

    Notice that this paragraph shows up on the same bullet at the previous paragraph!

- Now this is a third bullet, also part of the same list.


# Auto-Numbered Lists

<!-- What if you want to make a list, but then interrupt it with something else, then come back to
     resume the list later? You could do this numbering yourself, but this can become more tedious
     as the number of items in the list increases. Featuring auto-numbered lists! Instead of beginning
     the line with the number, begin it with @. This indicates an auto-numbered list. -->

@. This is the first item in the list. Notice that in the final output, this will simply say 1.
@. This is the second item in the list. So far, so good!

Now I will interrupt this list and get back to it in another section!

# Links

<!-- To create a link, use square brackets for the displayed text of the link, and parentheses for the link itself.
     To use the link itself as the printed text, use angled brackets. (Some links may not work if they don't have
     "http://" or "https://" at the beginning.) -->

Here's how to get to [Google](https://google.com)!

This is another link: <https://ucf.edu>


Here's a horizontal line! 
<!-- (Make sure to put new lines before and after it!) -->

---

<!-- In PDF files, sometimes we want to manually start a new page to format contents
     a certain way. You can use native LaTeX within this pandoc flavor of markdown as well!
     This will be completely invisible in HTML outputs, but shows in the formats that have pages. -->

\newpage

# Images

<!-- To make an image, this is almost the same as a link, but with an exclamation point before it.
     The text in the square brackets in this case will be the alt text. The link to an image may
     also be a relative path from the current markdown file. 
     
     The backslash at the ends of these images are applicable in the case of PDF files. When a file
     is exported to PDF, images are turned into "figures" by default. This can be handy if you did
     want them as figures, but the backslash at the end will ensure that the image is inline with
     the rest of the surrounding text (removing the figure functionality). -->

![Picture of Books](https://wikiknights.files.wordpress.com/2020/02/libraryicon.png)\

![Mountain](mountain.jpg)\


# Monospaced ("Code Style") Text

<!-- To write monospace text, surround it with one backtick (`). This can be helpful when, for example,
     you want to refer to a coding concept in the middle of a paragraph, but in a visually distinct style
     to indicate that you are not necessarily referring to a word in the English language. -->

Example:

Today I'm going to tell you about the world of conditions! While you are working on a `while` loop, make sure
to put a condition inside of the parentheses, or you use a `break` statement to end it! Otherwise you could
end up in an infinite loop! Oh no!

# Code Blocks

<!-- Sometimes, you want to be able to show code, console output, and more, with even syntax highlighting
     and all that. It's pretty easy! Simply surround it with three backticks (```). -->

```
This is some text that will show up exactly the way you write it!
I can even make ASCII art here!

 O    - "ay yo"
/|\
/ \
```

<!-- To write a code block with syntax highlighting, simply put the name of the language after the three backticks. -->

C code with syntax highlighting:

``` c
#include <stdio.h>

int main(void)
{
  printf("Hello, world!\n");
  return 0;
}
```

<!-- Pandoc has a special attribute class (.numberLines) that allows us to add line numbers to the beginning of
     each line! This can be especially handy when you want to point to a specific line of code within a block.
     Notice that class attributes are written within curly braces, and each attribute class begins with a dot. -->

Code block with line numbers:

``` {.numberLines}
This block of text
Has
Numbers!

  O     - "neat"
--|--
 / \
```

<!-- It's no problem to even stack attributes together! -->

C code with syntax highlighting and line numbers:

``` {.c .numberLines}
int fib(int n)
{
  if (n < 0) return 0;
  if (n < 2) return n;

  return fib(n - 1) + fib(n - 2);
}
```

<!-- We have also added a custom "terminal" attribute, which can be referred to with .terminal,
     .console, or .command-line. Any of them works! This is ideal for situations where you
     want to show the terminal output to some code in a visually distinct form. -->

"Terminal style" code block:

``` {.terminal}
Microsoft Windows [Version 10.0.10240]
(c) 2015 Microsoft Corporation. All rights reserved.

C:\WINDOWS\System32>
```

# Auto-Numbered Lists (Continued)

We're back to that auto-numbered list! Let's pick up where we left off:

@. This is the next item of the list. (It should say it is the third item!)
@. Finally, this is the last item of the list. Oh no, it's over so soon!