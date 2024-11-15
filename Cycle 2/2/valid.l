%{
    #include "y.tab.h"
%}

%%
[a-zA-Z_][a-zA-Z_0-9]* {return letter;}
[0-9] {return digit;}
.  {return yytext[0];}
\n {return 0;}
%%

int yywrap(){
return 1;
}
/*
   yacc -d valid.y
lex valid.l
gcc lex.yy.c y.tab.c -w
./a.out
valid identifier:abc
invalid identifier:_456
*/