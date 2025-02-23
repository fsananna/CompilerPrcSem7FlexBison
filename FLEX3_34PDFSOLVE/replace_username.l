%{
#include <stdio.h>
#include <unistd.h>  // For getlogin()
%}
%%
username    printf("%s", getlogin());
.           putchar(yytext[0]);  // Copy other characters to output
%%
int main() {
    yylex();
    return 0;
}
/*how to compile:
flex replace_username.l
gcc -o replace_username lex.yy.c -lfl
echo "Hello username!" | ./replace_username
*/