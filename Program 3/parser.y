%{
#include <stdio.h>
void yyerror(char *s) { printf("invalid string\n"); }
%}

%%
S: A 'b' { printf("valid string\n"); }
 ;

A: /* empty */
 | A 'a'
 ;
%%

int main() {
    printf("enter a string:\n");
    return yyparse();
}