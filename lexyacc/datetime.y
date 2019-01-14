/* Datetime */
/* datetime.y */

%{
  #include <cstdio>
  #include <iostream>
  using namespace std;

  // stuff from flex that bison needs to know about:
  extern int yylex();
  extern int yyparse();
  extern FILE *yyin;
 
  void yyerror(const char *s);
%}

%union {
  int ival;
  char *sval;
}

// constant-string tokens
%token AM PM
%token SEPARATOR
%token END

// terminal symbols
%token <ival> DIGIT
%token <sval> STRING

%%
time:
  datetime end {
    cout << "done with the dates file!" << endl;
  }
  |
    datetime time
  ;

datetime:
  hour ampm
  |  hour separator minute ampm
  |  hour separator minute
  ;
separator:
  SEPARATOR {
      cout << "new separator: " << ":" << endl;
    }
  ;
ampm:
  AM { cout << "new am: " << "AM" << endl; }
  | PM { cout << "new pm: " << "PM" << endl; }
  ;
hour:
  DIGIT {
      cout << "new hour: " << $1 << endl;
  }
  | DIGIT DIGIT {
      cout << "new hour: " << $1 << $2 << endl;
    }
  ;
minute:
  DIGIT DIGIT {
      cout << "new minutes: " << $1 << $2 << endl;
    }
  ;
end:
  END {
      cout << "end: " << "END" << endl;
    }
  ;

%%

int main(int, char**) {
  // Open a file handle to a particular file:
  FILE *myfile = fopen("dates", "r");
  // Make sure it is valid:
  if (!myfile) {
    cout << "I can't open dates!" << endl;
    return -1;
  }
  // Set Flex to read from it instead of defaulting to STDIN:
  yyin = myfile;
  
  // Parse through the input:
  yyparse();
  
}

void yyerror(const char *s) {
  cout << "EEK, parse error!  Message: " << s << endl;
  // might as well halt now:
  exit(-1);
}
