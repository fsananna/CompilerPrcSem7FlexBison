%{
#include <stdio.h>

int num_lines = 0, num_chars = 0;
%}
%%
\n          { ++num_lines; ++num_chars; }
.           { ++num_chars; }
%%
int main() {
    yylex();
    printf("# of lines = %d, # of chars = %d\n", num_lines, num_chars);
    return 0;
}
/*
How to compile :
flex count_lines_chars.l
gcc -o count_lines_chars lex.yy.c -lfl
echo -e "Hello\nWorld!" | ./count_lines_chars
*/