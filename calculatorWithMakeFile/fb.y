%{
#include <stdio.h>
#include <stdlib.h>
int yylex(); // Declare yylex()
void yyerror(const char *s); // Fix yyerror declaration
%}

%token NUMBER
%token ADD SUB MUL DIV ABS
%token EOL
%token AND OR

%%

calclist:
    | calclist exp EOL { printf("= %d\n", $2); }
    ;

exp: factor
    | exp ADD factor { $$ = $1 + $3; }
    | exp SUB factor { $$ = $1 - $3; }
     | exp AND factor { $$ = $1 & $3; }
    | exp OR factor { $$ = $1 ^ $3; }
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
    printf("Enter expressions:\n");
    return yyparse();
}

void yyerror(const char *s) { // Fix yyerror
    fprintf(stderr, "Error: %s\n", s);
}
