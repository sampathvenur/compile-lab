%{
#include <stdio.h>
int yylex(), yyerror(char *s) { puts("invalid string"); return 0; }
%}

%token A B

%%
S: A B { puts("valid string"); }
 ;

A: /* empty */
 | A A
 ;

%%
int yylex() {
    int c = getchar();
    if (c=='a') return A;
    if (c=='b') return B;
    if (c=='\n') return 0;
    return -1;
}
int main() { return yyparse(); }