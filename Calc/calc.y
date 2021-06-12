%{
#include "global.h"
#include <stdio.h>
#include <math.h>
#include <stdlib.h>


%}

%token	NUMBER MINUS PLUS DIV MULT LP RP AND OR IMP
%token	END


%start Input
%%

Input:
	  /* Empty */
	| Input Line
	;

Line:
	  END
	| S END		{ printf("Wynik: %f\n",$1); }
	;

S:
	  T				{ $$=$1; }
	| S PLUS T  			{ $$=$1+$3; }
  | S MINUS T                     { $$=$1-$3; }
	;

T:
		Q			{$$=$1;}
	| T MULT Q {$$=$1*$3;}
	| T DIV Q {$$=$1/$3;}
;

Q:
		R			{$$=$1;}
	| Q OR R {$$=(int)$1||(int)$3;}
	| Q AND R {$$=(int)$1&&(int)$3;}
	| Q IMP R {$$=!(int)$1||(int)$3;}
;

R:
		NUMBER {$$=$1;}
	| LP S RP	{$$=$2;}
	| MINUS NUMBER {$$=-$2;}
;



%%

int yyerror(char *s) {
  printf("%s\n",s);
}

int main(void) {
  yyparse();
}
