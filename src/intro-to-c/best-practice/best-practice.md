---
title: Programming Best Practices
author: Jerrett Longworth
---

This outlines a few of the common best practices used in the software industry to create code that is reliable, easy to read, and makes it easy to collaborate with other programmers. The goal of best practices are to not only be to write good code today, but have that code continue to stand as good code into the future.

Some of these practices are general to any programming language, while some are specific to the C language. For tips that apply to any programming language, examples will be written in C, but these translate to other languages accordingly.

Some programmers will argue that certain tips may not apply depending on the specific situation, and while this may be true, these practices still act as general guidelines in programming.

---

# Best Practices for Any Language

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

## Keep It Simple, Stupid (KISS)

## New Code by Addition, Not Subtraction

## Choose Consistency

In:

- Style (indentation et al.)
- Variable names
- Verbiage of functions (i.e. "check_window()" and "window_checking()" do not belong together)
  - And mirroring - "enter" and "exit", versus "open" and "close"
- The orders of things

If in a larger project, agree upon a standard and style guide. Use linting if desired.

## Avoid Side-Effects

# Best Practices for C

## Defined Function Parameters
