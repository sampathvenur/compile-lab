%token KEY ID OP

%%

input:
    | input token
    ;

token:
      KEY { printf("keyword is\n"); }
    | ID  { printf("identifier is\n"); }
    | OP  { printf("operator is\n"); }
    ;

%%

int main() { return yyparse(); }
int yyerror(char *s) { return 0; }
