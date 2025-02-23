%{
#include <stdio.h>
%}

%%

"colour"        { printf("color"); }
"flavour"       { printf("flavor"); }
"clever"        { printf("smart"); }
"smart"         { printf("elegant"); }
"conservative"  { printf("liberal"); }
"realise"       { printf("realize"); }
"analyse"       { printf("analyze"); }
"defence"       { printf("defense"); }
"offence"       { printf("offense"); }
"metre"         { printf("meter"); }
"centre"        { printf("center"); }
"theatre"       { printf("theater"); }
"travelling"    { printf("traveling"); }
"programme"     { printf("program"); }
"apologise"     { printf("apologize"); }



.               { printf("%s", yytext); } /* Print all other characters as they are */

%%

int main() {
    yylex();  // Call lexical analyzer
    return 0;
}
