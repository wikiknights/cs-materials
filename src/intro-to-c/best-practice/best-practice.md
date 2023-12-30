---
title: Programming Best Practices
author: Jerrett Longworth
---

This outlines a few of the common best practices used in the software industry to create code that is reliable, easy to read, and makes it easy to collaborate with other programmers. The goal of best practices are to not only be to write good code today, but have that code continue to stand as good code into the future.

Some of these practices are general to any programming language, while some are specific to the C language. For tips that apply to any programming language, examples will be written in C, but these translate to other languages accordingly.

Some programmers will argue that certain tips may not apply depending on the specific situation, and while this may be true, these practices still act as general guidelines in programming.

---

# Best Practices for Any Language

## Reduce Cognitive Load

"Cognitive load" is a measure of how much time and effort it takes to understand something (particularly code in this case). Behind most other best practices lies this principle.

An important goal with programming, especially when working with others (including your future self) is to reduce the amount of time and effort it takes to understand a piece of code. If a programmer works on a project, leaves to focus on something else for a few months, then come back to work on it again, how long would it take for them to understand how everything works again? What if they left for a year? What if a completely different programmer continued to work on it? This is the idea behind cognitive load.

There will always be some cognitive load associated with any project, so it cannot be removed entirely, but measures can be taken during the coding process to alleviate the headaches of someone else later. Here are some signals that your code may have more cognitive load than it needs:

- You have extra information about how your code works in your head that is not written anywhere.
- While abstraction is good, too much can make understanding code difficult, as a programmer may need to jump to many different functions to fully understand a segment of code. Some code is prematurely optimized, before a certain level of abstraction is needed.

## The Single-Responsibility Principle (SRP)

The *single-responsibility principle* states that "A module should be responsible to one, and only one, actor." In practice, this means that a function should only ever do one thing. This principle also applies to structs in C, and in other programming languages, this applies to objects.

To apply the single-responsibility principle to functions, the goal is to ensure a function's scope and *responsibility* is narrowed to one task. That said, a function *is* allowed to have sub-tasks, but they must be strictly necessary for the completion of the primary task.

Let's take a look at an example!

Suppose I was writing a hypothetical program for a robot that changes a car's tire. This is an example of what **not** to do:

``` c
void change_tire(void)
{
  purchase_tire();
  take_out_tools();
  remove_hubcap();
  remove_lug_nuts();
  take_off_tire();
  place_new_tire();
  apply_lug_nuts();
  apply_hubcap();
  put_away_tools();
  discard_old_tire();
}
```

This may at first appear to follow the single-responsibility principle, as everything in this `change_tire()` function is related to changing a tire. However, the key word in that sentence is *related*. Retrieving a new tire at the beginning and discarding the old tire at the end are *related*, but these are not necessary in the process of *just* changing a tire.

While this may be valid for smaller approaches, if this program continues to grow, perhaps even to the size of a factory, it can become less manageable to make future changes.

What if different tools are required for a different car? What if you already have a spare tire and don't need to buy an extra one? What if you want to keep your tools out to change a second tire? You may argue that these are all hypothetical cases, or that all of these cases could all still be handled within one `change_tire()` function, but if the goal is to "just change a tire," the single-responsibility principle is no longer satisfied.

Instead, you may want to consider breaking down `change_tire()` like the following:

``` c
void change_tire(void)
{
  remove_hubcap();
  remove_lug_nuts();
  take_off_tire();
  place_new_tire();
  apply_lug_nuts();
  apply_hubcap();
}

void main(void)
{
  if (!tire_available())
  {
    purchase_tire();
  }
  take_out_tools();

  change_tire();

  put_away_tools();
  discard_tire();
}
```

Notice now that the functionality for the actual "changing" is kept within one function, without additional complications to it.

## Don't Repeat Yourself (DRY)

"Don't repeat yourself" is a phrase in programming practice that essentially boils down to writing code in a way that is concise and easy to maintain. Let's take a look at an example of what this might look like:

``` c
// Suppose I am making a weather app with some default locations to show
// information about when the program starts.

int main(void)
{
  // ...

  show_current_weather("Orlando, FL");
  show_current_weather("New York City, NY");
  show_current_weather("Chicago, IL");
  show_current_weather("Las Vegas, NV");

  // ...
}
```

This would not satisfy the "don't repeat yourself" principle, as you may expect, because there are many lines that repeat with only slight changes. (In addition, a telltale sign that this principle is not satisfied is if a programmer ever needs to copy-paste their own code.)

What if the name of the `show_current_weather()` function changes, or it adds more parameters? What if you want to use the same locations and display other information about them, like the weekly forecast? While these are again hypothetical cases, the point of best practices are to help with managing both present and future code in a reliable way.

A way to write this without the repetition may be the following:

``` c
int main(void)
{
  // ...

  char *default_locations[] = {"Orlando, FL", "New York City, NY", "Chicago, IL", "Las Vegas, NV"};
  int location_count = 4;

  for (int i = 0; i < location_count; i++)
  {
    show_current_weather(default_locations[i]);
  }

  // ...
}
```

In this version, the program is now more flexible while accomplishing the same original task. If there happen to be changes in the function or default locations, these are now easier to maintain as a programmer.

However, something else to keep in mind is that the original code seen may be perfectly acceptable for a small program, such that perhaps this may be the limit of the program's functionality. This leads right into the next best practice...

## Keep It Simple, Stupid (KISS)

It is important as a programmer to consider how "complex" a program needs to be. Another way to say this is the following: if a program doesn't need to be more complicated, don't make it more complicated. Programs with increasing length and complexity usually necessitate more time for other programmers to understand them (or even yourself if you have not seen the program in a while).

While it is great to have a program with plenty of options and features to operate in a variety of situations, this is not all there is to creating programs. Consider, for example, the previous weather program. The functionality of showing the current weather was initially simple with four lines, and then changed to use a more nuanced approach, separating the list of default locations from the code that shows the current weather.

This change is great if this program is expected to have more features in the future, perhaps as a mobile phone app or website. However, if this program is merely intended for a simple look at the weather, it may be worth considering leaving the original code as-is. It is important to weigh the "cognitive load" it takes to understand a program versus the potential investment it would take to make changes around it.

## You Aren't Gonna Need It (YAGNI)

This idea states to wait to add something into a program only when it is actually necessary. While it may sound exciting to add lots of new, flashy features to a program, it is important to take pause and think about if it is really needed. Any additions to a program automatically make it more difficult to understand.

## Choose Consistency

When writing code, choose a consistent scheme in every aspect where possible. Here are a few points where you may think about being consistent:

- **Style and formatting.** (This includes indentation, spacing, alignment of brackets, etc.)

    As an example, which code sample is more readable to you?

    Sample 1:

    ```c
    #include <stdio.h>
    int main(void){
    for(int i=10;i>=0;i--)
    {
    printf("How many cookies do I have?\n");
      printf("I have %d cookies!\n",i);
    }
    printf("No more cookies :(\n");
    return 0;
    }
    ```

    Sample 2:

    ```c
    #include <stdio.h>
    int main(void)
    {
        for (int i = 10; i >= 0; i--)
        {
            printf("How many cookies do I have?\n");
            printf("I have %d cookies!\n", i);
        }
        printf("No more cookies :(\n");
        return 0;
    }
    ```

    The second sample may be considered more consistent and easier to read due to its indendation and formatting style.

- **Variable names.** When creating variables across a program, use the same naming conventions across all parts.
- **Verbiage of function names.** When creating functions, use a consistent form to name functions. For example, `check_window()` and `window_checking()` use two different grammatical structures and should ideally not be in the same program. A common approach is to have all functions start with a verb, but this may not be preferred in all contexts.
- **Mirroring of function names.** This is similar to the last point, but is specifically targeted for functions that serve related purposes. Use word pairings that are common in language, like "enter/exit," or "open/close." For example, suppose there is a program that reads a file, gathers some data, then finishes. When the program begins and ends, it is generally not a good practice to have functions named `open_file()` and `exit_file()`, as "open" and "exit" are not consistent. It would be more appropriate to use `open_file()` and `close_file()` in this case.
- **Ordering.** If a certain process has steps to begin and steps to end, it is good to mirror these steps across each. As an example, consider the tire changing example from earlier. If the setup process uses "purchase a tire" first then "take out tools" second, the teardown process should use "put away tools" first then "discard tire" second to mirror the order from before.

An additional great way to be consistent is to adhere to a *style guide*. Nearly every language and framework has a style guide (sometimes created by the people who made it), and offer a standardized way to write code. A certain style can be made easier to commit to by using a *linter*, a type of tool used by programmers to enforce good coding patterns.

## Write Comments

Comments are the number one best way for programmers to communicate with each other, either across space (with other people) or across time (with yourself). By writing constructive comments about the thought processes involved with writing code, a programmer can help someone else to understand the logic later, without needing to take the time to trace these steps for themselves.

Use comments to explain on a high level *why* things were designed the way they were, possibly some of the advantages and limitations, or what groups of code does that may not otherwise be clear. Comments help tell the story of how code works.

A few rules of thumb:

- Your comments should not restate what the code already says. (Alternatively, if you find that you write comments for every line of code, you are probably writing too many comments.)

    For example, the following comment is unnecessary:

    ``` c
    x = x + 1;  // Add one to x
    ```

- If you find a problem with your code to be addressed later, or your code is incomplete, write a comment describing this.
- If a bug arises in your code and you fix it, write a comment describing how it was fixed.
- Comments do not substitute good code. For example, instead of using single-letter or otherwise misleading variable names (and explaining the code in a comment), incorporate the phrasing of the comment into the code itself.

    See this example of a poor use of comments:

    ``` c
    int get_largest_value(int *arr, int le)
    {
      // Initially, the largest value is the first value.
      int l = arr[0];

      for (int i = 1; i < le; i++)
      {
        // Update the largest value if the current value is larger.
        l = (arr[i] > l) ? arr[i] : l;
      }

      return l;
    ```

    This code may take a programmer longer than necessary to understand due to the use of short, vague variable names. The comments help, but should really be incorporated into the code itself.

    The following is a better use of comments and code structure (notice that assumptions made in the function are also added):

    ``` c
    // Given an array of integers and its length, this function returns the value of
    // the largest element.
    //
    // Note: It is assumed that the array has a length of at least one, and that the
    // pointer to `array` is non-null.
    int get_largest_value(int *array, int length)
    {
      // Initially, the largest value is the first value.
      int largest = array[0];

      // Check through all other elements in the array, and update the largest value as needed.
      for (int i = 1; i < length; i++)
      {
        if (array[i] > largest)
        {
          largest = array[i];
        }
      }

      return largest;
    ```

- You should explain code that is not already a common practice in the language. (This point will vary depending on your level of knowledge of what is best practice, and this is okay. Part of becoming a better programmer is learning what is common enough to no longer need an explanation for.)

    For example, while the following comment is typically unnecessary, it may be helpful while first learning C.

    ``` c
    // Instead of writing an explicit check of `free_space_available == true`, it can simply
    // be written as `free_space_available`, as C can interpret the value of a variable
    // as "truth-y" or "false-y".
    if (free_space_available)
    {
      ...
    }
    ```

- If you use outside sources to assist with your code (either documentation or code examples online), add links to the original code in your comments. This will give an easy location to refer to more information about a particular piece of code, should it be needed later.


# Best Practices for C

These practices are specific to the C language and some of its specific eccentricities.

## Defined Function Parameters

Functions in C do not *require* a set of function parameters. For example, this is a valid function:

``` c
// Generate a random integer between 0 and 99.
// (Assume that everything is set up correctly for random number generation.)
int generate_number()
{
  int random_number = rand() % 100;
  return random_number;
}
```

No problems here! But a strange thing can happen when you call this function...

``` c
// Assume all required libraries are included.
int main(void)
{
  int numbers[4];

  int seed = 23512;
  srand(seed);

  // Should these work?
  numbers[0] = generate_number();
  numbers[1] = generate_number(seed);
  numbers[2] = generate_number(7);
  numbers[3] = generate_number(5, 5.5, 21, "apples");

  for (int i = 0; i < 4; i++)
  {
    printf("numbers[%d] = %d\n", i, numbers[i]);
  }

  return 0;
}
```

While the `generate_number` function is called with a variety of different arguments, this still works! This is not considered a good practice because the function can be used ambiguously, using *undefined function parameters*.

Functions should always have defined parameters. Thus, it would be better to write `generate_number` like the following:

``` c
int generate_number(void)
```

With the addition of `void`, there is now an explicit expectation that no arguments are used with the `generate_number` function.
