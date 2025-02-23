%{
#include "hdCalc.tab.h" // Use Bison-generated token definitions
#include <stdlib.h>
%}

%%
[0-9]+           { yylval = atoi(yytext); return NUMBER; }  // Decimal numbers
0[xX][a-fA-F0-9]+ { yylval = strtol(yytext, NULL, 16); return NUMBER; }  // Hex numbers
"+"              { return ADD; }
"-"              { return SUB; }
"*"              { return MUL; }
"/"              { return DIV; }
"|"              { return ABS; }
\n               { return EOL; }
[ \t]            { /* Ignore spaces */ }
.                { printf("Unexpected character: %c\n", *yytext); }

%%

int yywrap() { return 1; }
