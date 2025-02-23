#include <stdio.h>
#include <ctype.h>

int main()
{
    int words = 0, inWord = 0;
    char c;
    while ((c = getchar()) != EOF)
    {
        if (isspace(c))
        {
            inWord = 0;
        }
        else if (!inWord)
        {
            inWord = 1;
            words++;
        }
    }
    printf("Words: %d\n", words);
    return 0;
}
