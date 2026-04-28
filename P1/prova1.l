%{
#include "prova1.tab.h"
#include <stdlib.h>
#include <string.h>

void yyerror(const char *msg);
int yylex();
%}

%option noyywrap

%%

[0-9]+\.?[0-9]+|[0-9]+ {return NUM;}
"-" {return MINUS;}
"+" {return PLUS;}
"*" {return TIMES;}
"/" {return DIV;}
"(" {return LPAREN;}
")" {return RPAREN;}

"=" {return ASSIGN;}                    // atribuicao
"," {return COMMA;}                     // virgula para concatenar

"print" {return PRINT;}                 // print
"concat" {return CONCAT;}               // concatenar string
"lenght" {return LENGHT;}               // comprimento de string

\"[^\n]*\" {return STRING;}           // string entre aspas
[a-zA-Z][a-zA-Z0-9_]* {return IDENT;}   // variavel id

"//"[^\n]* {return COMMENT;} ;                            // comentarios de uma linha
[ \t\r\n]+ ;



.       { return ERROR; }

%%
