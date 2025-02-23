%{
#include "fb.tab.h" // Correct token definitions
#include <stdlib.h> // Include stdlib for atoi()
%}

%%

[0-9]+   { yylval = atoi(yytext); return NUMBER; }
"+"      { return ADD; }
"-"      { return SUB; }
"*"      { return MUL; }
"/"      { return DIV; }
"|"      { return ABS; }
\n       { return EOL; }
[ \t]    { /* Ignore spaces */ }
.        { printf("Unexpected character: %c\n", *yytext); }

%%

int yywrap() { return 1; }
