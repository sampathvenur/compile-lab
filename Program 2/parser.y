%{
#include <stdio.h>
#include <stdlib.h>
int yylex(), yyerror();
%}

%token NUM
%left '+' '-'
%left '*'

%%
S: E { printf("= %d\n", $1); }
 ;

E: E '+' E { $$ = $1 + $3; }
 | E '-' E { $$ = $1 - $3; }
 | E '*' E { $$ = $1 * $3; }
 | NUM     { $$ = $1; }
 ;

%%
int yylex() {
  int c;
  while ((c = getchar()) == ' ' || c == '\n');
  if (isdigit(c)) {
    ungetc(c, stdin);
    scanf("%d", &yylval);
    return NUM;
  }
  return c;
}
int yyerror() { return 0; }
int main() { return yyparse(); }
