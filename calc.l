/* A simple scanner for a calculator */
%{
#include <stdio.h>
%}

%%

"+"         { printf("PLUS\n"); }
"-"         { printf("MINUS\n"); }
"*"         { printf("TIMES\n"); }
"/"         { printf("DIVIDE\n"); }
"|"         { printf("ABS\n"); }
[0-9]+      { printf("NUMBER %s\n", yytext); }
\n          { printf("NEWLINE\n"); }
[ \t]       { /* Ignore spaces and tabs */ }
.           { printf("Mystery character %s\n", yytext); }

%%

int main() {
    yylex();  // Call the scanner
    return 0;
}
