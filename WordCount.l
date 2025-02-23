%{
#include <stdio.h>
#include <string.h>

int chars = 0;
int words = 0;
int lines = 0;
%}

%%

[a-zA-Z]+     { words++; chars += strlen(yytext); }
[ \t]+        { chars += strlen(yytext); }  /* Count spaces/tabs */
\n            { lines++; chars++; }  /* Count new lines */
[^a-zA-Z\n\t] { chars++; }  /* Count punctuation/special characters */

%%

int main() {
    yylex();
    printf("%8d%8d%8d\n", lines, words, chars);
    return 0;
}
