# A Quick Review on Variables

*Originally created by Idel Martinez in Spring 2021.*

## **Declare**-ing a variable.

``` c
int main(void)
{
  /* This program doesn't do much, but it does declare three variables
   * of different types!
   *
   * Notice that we declare variables like this:
   * <return_type> <variable_name>;
   */

  int num0;
  float num1;
  double num2;

  return 0;
}
```

## **Assign**ing a value to a variable with the assignment operator: `=`

Using the previous example, let's assign values to the variables! We can do this in different ways:

``` c
int main(void)
{
  int num0;  // Declare a variable
  num0 = 10; // Assign a value to it

  float num1 = 0.5; // Declare a variable and assign a value to it in the same line

  double num2 = sqrt(4); // Declare a variable and assign the value of whatever the function returns (in this case 2.0)

  return 0;
}
```