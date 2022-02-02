# Data types

We store information in RAM through variables and there are certain datatypes that are used for this.

## Datatypes you should know

You do need to know off the top of your head how many bytes each datatype holds, this is just for informational purposes. Focus on knowing when to use each datatype and what each of them stores.

- **int:** stores integers (2 or 4 byte)
    ```c
    int a = 1
    ```
- **float:** stores decimal numbers to about 6 digits of precision (4 byte)
    ```c
    float b = 1.555555
    ```
- **double:** stores decimal numbers to about 15 digits of precision (8 byte)
    ```c
    double c = 0.999999999999999
    ```
- **long (int):** stores big integers, the 'int' is optional (8 byte)
    ```c
    long d = 123456790
    ```
- **long double:** stores big decimal numbers to about 19 digits of precision (10 byte)
    ```c
    long double e = 1.0000000000000000001
    ```
- **char:** stores a single character (1 byte)
    ```c
    char f = '@'
    ```
- **string:** an array of char's that allows you to form words
    ```c
    char[] g = "hello"
    ```
- **void:** stores no value (useful for functions)
    ```c
    void h(int i) {
        // some code in your function
        // there will be no return here
    }
    ```

## Format Specifiers
If you wish to get user input and hold it to a variable or display the variable to the string, you will need to use a format specifier. Each datatype has its own format specifier except for void.

- **int:** %d
- **float:** %f
    - to control the decimal precision use %0.nf where n is a number
    ```c
    float j = 4.5678;
    printf("%0.2f", j) // it would display 4.57
    ```
- **double:** %lf
- **long (int):** %l
- **long double:** %Lf
- **char:** %c
- **string:** %s


## Useful links
To check the value range or another specifier:
- [Tutorials Point - C Data Types](https://www.tutorialspoint.com/cprogramming/c_data_types.htm)
- [Tutorials Point - Format Specifiers in C](https://www.tutorialspoint.com/format-specifiers-in-c)
