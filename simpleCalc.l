%{
#include <stdio.h>
#include <stdlib.h>
#include "calc.tab.h"  // Include Bison-generated header
%}

%%
"+"    { return ADD; }
"-"    { return SUB; }
"*"    { return MUL; }
"/"    { return DIV; }
"|"    { return ABS; }
[0-9]+ { yylval = atoi(yytext); return NUMBER; }  // Convert string to integer
\n     { return EOL; }
[ \t]  { /* Ignore spaces */ }
.      { printf("Unexpected character: %c\n", *yytext); }

%%

int yywrap() {
    return 1;  // Required for Flex
}

/*steps to run these code:
bison -d simpleCalc.y -o calc.tab.c
flex -o lex.yy.c simpleCalc.l
gcc calc.tab.c lex.yy.c -o simpleCalc -lfl -lm
./simpleCalc
*/