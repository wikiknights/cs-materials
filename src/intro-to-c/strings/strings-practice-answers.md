# Strings Practice (Solutions)

A fun thing to do in these exercises is to create a separate function and call it in main. That way, you can have your own library of functions and reuse it if you need.

1. Write a function that receives a word and return its length without using any libraries.
```c
#include <stdio.h>

int length(char *word);

int main(void) {
    char word[30];
    printf("Enter your word.\n");
    scanf("%s", word);

    printf("The length of your word is %d\n", length(word));

    return 0;
}

// returns the length of the string pointed to by word
int length(char *word) {
    // declare the counter
    int i=0;

    // keep on counting until the null character
    while (word[i] != '\0')
        i++;

    // finally, return the counter
    return i;
}
```

2. Write a function that receives a word and turns it into uppercase.
```c
#include <stdio.h>
#include <ctype.h>
#include <string.h>

void to_upper(char *word);

int main(void) {
    char word[30];
    printf("Enter your word.\n");
    scanf("%s", word);

    to_upper(word);
    printf("Your word is now upper case: %s\n", word);

    return 0;
}

// changes the string pointed to by word to be upper case
void to_upper(char *word) {

  int i=0;

  // go through each character one by one, changing it to upper case
  while (word[i] != '\0') {
    word[i] = toupper(word[i]);
    i++;
  }
}
```

3. Write a function that receives two words and checks if they are equal.
```c
#include <stdio.h>
#include <ctype.h>
#include <string.h>

int equal(char *w1, char *w2);

int main(void) {
    char word1[30], word2[30];
    printf("Enter your word.\n");
    scanf("%s", word1);
    printf("Enter another word.\n");
    scanf("%s", word2);

    if (equal(word1, word2))
        printf("You entered two equal words.\n");
    else
        printf("Your words are different.\n");

    return 0;
}

// returns 1 if the strings pointed to by w1 and w2 are identical
// returns 0 otherwise
int equal(char *w1, char *w2) {

  int i=0;

  // keeps on going
  while (1) {
    // characters don't match, not equal!
    if (w1[i] != w2[i])
      return 0;

    // if we match the null character, the strings are equal!
    else if (w1[i] == '\0')
      return 1;

    i++;
  }
}
```

4. Write a function that receives a word and check if it is a palindrome.
```c
#include <stdio.h>
#include <ctype.h>
#include <string.h>

int palindrome(char *word);

int main(void) {
    char word[30];
    printf("Enter your word.\n");
    scanf("%s", word);

    if(palindrome(word) == 1)
        printf("%s is a palindrome.\n", word);
    else
        printf("%s is not a palindrome.\n", word);
  
    return 0;
}

int palindrome(char *word) {

  int len, index;
  index = 0;
  len = strlen(word);

  while (word[index] == word[len-1-index] &&
         index < len/2)
    index++;

  if (index == len/2)
    return 1;

  return 0;
}
```

5. Write a function that receives a word and reverses it.
```c
#include <stdio.h>
#include <ctype.h>
#include <string.h>

int palindrome(char *word);

int main(void) {
    char word[30];
    printf("Enter your word.\n");
    scanf("%s", word);

    reverse(word);
    printf("Your word reversed is %s\n", word);
  
    return 0;
}

// reverses the contents of the string pointed to by word
void reverse(char *word) {

  int i, len;
  char temp;

  // get the length of the word
  len = length(word);

  // go half-way through
  for (i=0; i<len/2; i++) {

    // swap "opposite" side letters!
    temp = word[i];
    word[i] = word[len-1-i];
    word[len-1-i] = temp;
  }
}
```

6. **CHALLENGE** How would you read a first and last name and display it to the screen?
You can use `fgets()` to read the string and `puts()` to print it.
```c
#include <stdio.h>

int main(void) {
    char name[30];
    printf("Enter your name.\n");
    fgets(name, sizeof(name), stdin);  // read string
    puts(name);    // display string
    return 0;
}
```