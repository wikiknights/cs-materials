# Strings

Strings are used to form words or sentences. In C, they are an array of characters.

## Declaring Strings
To declare a string, you use the `char` datatype, along with the name of the variable and the size between brackets, like an array:

```c
char name[size];
```

For example, the variable word is a string of size 20:
```c
char word[20];
```

## Initializing Strings
You can initialize a string in many different ways:

```c
char word[] = "hello";

char word[50] = "hello";

char word[] = {'h', 'e', 'l', 'l', 'o', '\0'};

char word[6] = {'h', 'e', 'l', 'l', 'o', '\0'};

char word[20];
word[0] = 'h';
word[1] = 'e';  
word[2] = 'l';
word[3] = 'l';
word[4] = 'o';
word[5] = '\0';
```

The last element has to be a null character (`'\0'`) to terminate the array and string.

Therefore, be aware when scanning a string with `scanf()` because it will read all characters until a whitespace is read.

## Important note on the quotes
When initializing, using 'a' or "a" will lead to different datatypes:
- 'a' is a single character

- "a" is stored in the character array of at least size two

## String Library
Inside the `<string.h>`, there are some very useful functions for manipulating strings.

`char* strcat(char *s1, const char *s2);`

This function concatenates the string s2 to the string s1 and stores the result in s1. The const in front of s2 indicates that the function will not change the contents of the string s2.

`int strcmp(const char *s1, const char *s2);`

This function compares the two strings s1 and s2. If s1 comes first alphabetically, an integer less than 0 is returned. If the two strings are equal 0 is returned. If s2 comes before s1 instead, an integer greater than 0 is returned.

`int strcpy(char *s1, const char *s2);`

This contents of s2 are copied into s1. This works DIFFERENTLY than s1 = s2, which would just copy a pointer.

`int strlen(const char *s);`

Returns the number of characters in s before a '\0' is encountered.

For more information, check out [this website](https://www.tutorialspoint.com/c_standard_library/string_h.htm)