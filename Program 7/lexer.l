%{
int comments = 0;
%}

"/*"(.|\n)*?"*/" {
    // Count newlines inside block comment
    for (int i = 0; yytext[i]; i++)
        if (yytext[i] == '\n') comments++;
}

"//".* {
    comments++;   // Count single-line comment
}

\n      { ECHO; }
[^/\n]+ { ECHO; }
.       { ECHO; }

%%

int main() {
    yylex();
    printf("\nTotal comment lines: %d\n", comments);
    return 0;
}
