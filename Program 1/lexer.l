%{
#include <stdio.h>
#include <stdlib.h>

int num=0, op=0, top=-1;
int number[10];
char opr[10], stack[10];
%}

DIGIT   [0-9]

%%

{DIGIT}+     { number[num++] = atoi(yytext); }
"+"          { opr[op++] = '+'; }
"*"          { opr[op++] = '*'; }
"("          { stack[++top] = '('; }
")"          {
                if(top != -1 && stack[top] == '(') top--;
                else {
                    printf("Invalid expression\n");
                    exit(0);
                }
             }
[ \t\n]      ;  /* ignore whitespace */
.            { printf("Invalid character: %s\n", yytext); exit(0); }

%%

int main() {
    printf("Enter Expression:\n");
    yylex();
    if(top == -1 && num == op + 1) {
        printf("Valid Expression:\n");
        printf("Number of identifiers=%d\n", num);
        printf("Identifier are present\n");
        for(int i=0; i<num; i++) printf("%d\n", number[i]);
        printf("Number of operators=%d\n", op);
        printf("operators present are\n");
        for(int j=0; j<op; j++) printf("%c\n", opr[j]);
    } else {
        printf("Invalid Expression\n");
    }
    return 0;
}
