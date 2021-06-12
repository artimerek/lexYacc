%{
#include "global.h"
#include "y.tab.h"
#include <stdio.h>
#include <math.h>
#include <stdlib.h>

%}

white		[ \t]+

digit		[0-9]
real 		([1-9][0-9]*|0)(\.[0-9]+)?((e|E)(\+|\-)?[0-9]+)?
integer 	{digit}+

%%

{white} 	{ /* We ignore white characters */ }

{real}	{
		  yylval=atof(yytext);
		  return(NUMBER);
		}


"+"		return(PLUS);
"-"		return(MINUS);
"*"		return(MULT);
"/"		return(DIV);
"("		return(LP);
")"		return(RP);
"||"	return(OR);
"&&" 	return(AND);
"=>" return(IMP);

"\n"	return(END);
