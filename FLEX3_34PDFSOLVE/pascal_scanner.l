%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
%}

DIGIT   [0-9]
ID      [a-z][a-z0-9]*

%%

{DIGIT}+    { printf("An integer: %s (%d)\n", yytext, atoi(yytext)); }
{DIGIT}+"."{DIGIT}*   { printf("A float: %s (%g)\n", yytext, atof(yytext)); }
if|then|begin|end|procedure|function   { printf("A keyword: %s\n", yytext); }
{ID}    { printf("An identifier: %s\n", yytext); }
"+"|"-"|"*"|"/"    { printf("An operator: %s\n", yytext); }
"{"[^{}\n]*"}"   { /* Ignore Pascal-style comments */ }
[ \t\n]+   { /* Ignore whitespace */ }
.   { printf("Unrecognized character: %s\n", yytext); }

%%

int main(int argc, char **argv) {
    if (argc > 1) yyin = fopen(argv[1], "r");  // Read from a file if provided
    else yyin = stdin;  // Otherwise, read from standard input
    yylex();  // Start scanning input
    return 0;
}


/*
How to compile:
flex pascal_scanner.l
gcc -o pascal_scanner lex.yy.c -lfl
echo "if x + 5.5 then y = 10" | ./pascal_scanner

*/