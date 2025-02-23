%{
#include <stdio.h>
#include <stdlib.h>
%}

%token NUMBER
%token ADD SUB MUL DIV ABS
%token EOL

%%

calclist:
    | calclist exp EOL { printf("= %d (0x%X)\n", $2, $2); }  // Print decimal and hex
    ;

exp: factor
    | exp ADD factor { $$ = $1 + $3; }
    | exp SUB factor { $$ = $1 - $3; }
    ;

factor: term
    | factor MUL term { $$ = $1 * $3; }
    | factor DIV term { $$ = $1 / $3; }
    ;

term: NUMBER
    | ABS term { $$ = $2 >= 0 ? $2 : -$2; }
    ;

%%

int main() {
    printf("Enter expressions (supports hex and decimal numbers):\n");
    return yyparse();
}

void yyerror(char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
