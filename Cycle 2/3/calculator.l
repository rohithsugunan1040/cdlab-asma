%{
#include "y.tab.h"  // Include the header file generated by Yacc
%}

%%

[0-9]+    { yylval = atoi(yytext); return NUMBER; }  
"+"       { return '+'; }  
"-"       { return '-'; }  
"*"       { return '*'; }  
"/"       { return '/'; }  
"("       { return '('; }  
")"       { return ')'; }  
[ \t]+    { /* Ignore spaces and tabs */ }
.         { printf("Unexpected character: %s\n", yytext); }

%%

int yywrap() {
    return 1;
}
/*
   yacc -d pgm3.y
lex pgm3.l
gcc lex.yy.c y.tab.c -w
./a.out
3+3 valid
a+b in valid

*/