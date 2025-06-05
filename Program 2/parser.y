%{
#include <stdio.h>
int yylex(void);
void yyerror(char *s){ printf("%s\n", s); }
int err=0;
%}

%token NUM
%left '+' '-'
%left '*' '/'
%nonassoc UMINUS

%%

input:
    /* empty */
  | input expr '\n' {
      if (!err) printf("%d\n", $2);
      else {
        printf("Divide by Zero error\n");
        err=0;
      }
      printf("------------------------------------------------------------------------------------------------------------------------\n\n");
    }
  ;

expr:
    expr '+' expr { $$=$1+$3; }
  | expr '-' expr { $$=$1-$3; }
  | expr '*' expr { $$=$1*$3; }
  | expr '/' expr {
      if ($3==0) err=1; else $$=$1/$3;
    }
  | '-' expr %prec UMINUS { $$=-$2; }
  | '(' expr ')' { $$=$2; }
  | NUM { $$=$1; }
  ;

%%
int main(){
    printf("Enter an expression:\n");
    yyparse();
    return 0;
}