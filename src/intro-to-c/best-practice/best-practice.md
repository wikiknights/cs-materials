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

## New Code by Addition, Not Subtraction

## Choose Consistency

In:

- Style (indentation et al.)
- Variable names
- Verbiage of functions (i.e. "check_window()" and "window_checking()" do not belong together)
  - And mirroring - "enter" and "exit", versus "open" and "close"
- The orders of things

If in a larger project, agree upon a standard and style guide. Use linting if desired.


## Write Comments

# Best Practices for C

## Defined Function Parameters
