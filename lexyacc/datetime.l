/* Datetime */
/* datetime.l */

%{
  #include <iostream>
  using namespace std;
  #include "datetime.tab.h"
%}

%option noyywrap

%%

[ \t\n] ;
am           { return AM; }
pm           { return PM; }
:            { return SEPARATOR; }
end          { return END; }
[0-9]        { yylval.ival = atoi(yytext); return DIGIT; }

%%