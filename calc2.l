%{
#include <stdio.h>
#include <stdlib.h>

#ifdef __cplusplus
extern "C" {
#endif

enum yytokentype {
    NUMBER = 258,
    ADD = 259,
    SUB = 260,
    MUL = 261,
    DIV = 262,
    ABS = 263,
    EOL = 264
};

int yylval;  // Stores token values
int yylex(); // Declare yylex() properly

#ifdef __cplusplus
}
#endif
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

int main() {
    int tok;
    while ((tok = yylex())) {  
        printf("Token: %d", tok);
        if (tok == NUMBER) 
            printf(" = %d", yylval);  // Print token value
        printf("\n");
    }
    return 0;
}
