%{
#include "y.tab.h"
%}

"int"|"float"|"if"|"else"|"void"|"main"  { return KEY; }
[a-zA-Z_][a-zA-Z0-9_]*                   { return ID; }
"=="|"="|";"|"(" | ")" | "{" | "}"      { return OP; }
[ \t\n]+                                ;  /* skip whitespace */
.                                       ;  /* ignore others */
