%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
%}

/* Declare tokens */
%token NUMBER ADD SUB MUL DIV ABS EOL

%%

calclist:
    /* empty */
    | calclist exp EOL { printf("= %d\n", $2); }
    ;

exp:
    factor
    | exp ADD factor { $$ = $1 + $3; }
    | exp SUB factor { $$ = $1 - $3; }
    ;

factor:
    term
    | factor MUL term { $$ = $1 * $3; }
    | factor DIV term { 
        if ($3 == 0) {
            yyerror("Division by zero");
            $$ = 0;
        } else {
            $$ = $1 / $3;
        }
    }
    ;

term:
    NUMBER { $$ = $1; }
    | ABS term { $$ = $2 >= 0 ? $2 : -$2; }
    ;

%%

int main() {
    printf("Enter an arithmetic expression:\n");
    yyparse();
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
