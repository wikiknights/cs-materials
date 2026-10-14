# Writing Documents

Each document is written in a markdown file (making it both portable and easy to write). Information on markdown syntax can be found [here](https://www.markdownguide.org/basic-syntax/). These markdown files are then converted to other formats via a build script. The primary tool used to convert is called [`pandoc`](https://pandoc.org), and it uses an extended version of markdown for this. This gives additional flexibility for documents where needed. Information on these extensions can be found in [the pandoc manual](https://pandoc.org/MANUAL.html#pandocs-markdown).

A fully commented sample markdown file demonstrating everything can be found [here](sample-file.md).

## Metadata Blocks

Each file can have a metadata block at the top (in the form of YAML) that specifies the title of each the document and its author(s). (See [the pandoc manual](https://pandoc.org/MANUAL.html#extension-yaml_metadata_block) for more details.)

*Note: Metadata blocks are not required in a document, but are recommended.*

For example:
``` yaml
---
title: Document Title
author: John Smith
---
```

With multiple authors:
``` yaml
---
title: Document Title
author:
  - John Smith
  - Sally Mae
---
```

With special symbols, use quotation marks:
``` yaml
---
title: 'Document Title 2: Electric Boogaloo'
author: Danny Dorito
---
```

By default, a table of contents is added to the top of the page, but this can be disabled on a specific page by adding "`toc: false`" to a metadata block:
``` yaml
---
toc: false
---
```

## Code Blocks with Line Numbers

Code blocks (indicated by 3 back-ticks) can have line numbers added to the final output if the `numberLines` class is added. Notice the change in syntax if more than one class attribute is applied to a code block. (See [the pandoc manual](https://pandoc.org/MANUAL.html#extension-fenced_code_attributes) for more details.)

For example:
````
``` c
printf("This code block will not have line numbers.\n");
```

``` {.c .numberLines}
printf("This code block will have line numbers.\n");
```
````

## Numbered Lists (Automatic Renumbering)

When creating numbered lists of practice problems, use `@.` to number the lists. This allows new problems to be added later with automatic renumbering. (See [the pandoc manual](https://pandoc.org/MANUAL.html#numbered-example-lists) for more details.)

For example:
``` md
@. This is the first question.
@. This is the second question.
@. This is the third question.
```

## Collapsible Answers (Practice Pages)

Practice pages are single pages: each question is immediately followed by its answer, wrapped in a raw HTML `<details>` element. There are no separate "-answers" files. On the HTML site, the answer is hidden behind an expandable "Answer" summary; in PDF/DOCX output pandoc strips the raw HTML tags, so the answer content is still rendered (simply uncollapsed).

````
@. What will this program print if executed?

  ``` c
  int main(void)
  {
    printf("Hello, world!\n");
    return 0;
  }
  ```

<details>
  <summary>Answer</summary>

**Answer:** `Hello, world!`

The `printf()` function prints its argument to the console.

</details>
````

Notes:

- Place `<details>` (at the start of the line) directly after the question, and close with `</details>` before the next question or heading. Leave a blank line after `<summary>` and before `</details>`.
- Inside the block, mark the answer with the usual `**Answer:**` / `**Sample Answer:**` / `**Possible Answer:**` convention.
- Because the raw HTML is stripped in non-HTML output, do not rely on the collapsing behavior itself (e.g., don't write "the answer above" style references that only make sense when collapsed).

## Hide Headings from Table of Contents

To hide a heading from a page's table of contents, add the `unlisted` class to the heading. For example:
``` md
# My Heading {.unlisted}
```
