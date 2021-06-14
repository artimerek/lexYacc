%{
  #include <stdio.h>
  #include <stdlib.h>

  FILE * fpointer;
  FILE * fpointer2;
%}


https [h][t][t][p][s]
www [w][w][w]
slash [/][a-z]*
lettersAndDigits [a-z|0-9]
url {www}[\.]{lettersAndDigits}*[\.][a-z]*
urlFromHttps {https}[:][/][/]{lettersAndDigits}+[\.][a-z]*{slash}+
urlFromHttpsWithWWW {https}[:][/][/]{www}[\.]{lettersAndDigits}+[\.][a-z]*{slash}+
email {lettersAndDigits}+[@]{lettersAndDigits}+[\.][a-z]*



%%
{url}  {
          fpointer = fopen("url.txt","a+");
          fprintf(fpointer,yytext);
          fprintf(fpointer,"\n");
          fclose(fpointer);
        }
{urlFromHttps} {
                  fpointer = fopen("url.txt","a+");
                  fprintf(fpointer,yytext);
                  fprintf(fpointer,"\n");
                  fclose(fpointer);
                }
{email} {
          fpointer2 = fopen("emails.txt","a+");
          fprintf(fpointer2,yytext);
          fprintf(fpointer2,"\n");
          fclose(fpointer2);
        }
{urlFromHttpsWithWWW} {
                        fpointer = fopen("url.txt","a+");
                        fprintf(fpointer,yytext);
                        fprintf(fpointer,"\n");
                        fclose(fpointer);
                      }
\n
.
%%


main() {
    yylex();
    printf("\nFile saved\n");
}
