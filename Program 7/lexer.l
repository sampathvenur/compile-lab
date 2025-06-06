%{
#include<stdio.h>
#include<stdlib.h>
int comment=0;
int state=1;
%}
%%
"//".*\n { comment++;}
"/*" { state=0;}
"*/" {if(state==0)
comment++;
state=1;}
.|\n {if(state==1) 
fprintf(yyout,"%s",yytext);}
%%
void main()
{
char inpfile[500],outfile[500];
printf("enter input file name\n");
scanf("%s",inpfile);
printf("Enter output file name\n");
scanf("%s",outfile);
yyin=fopen(inpfile,"r");
yyout=fopen(outfile,"w");
yylex();
printf("Total no. of comment line is: %d\n",comment);
}