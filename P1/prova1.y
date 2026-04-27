%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int yylex();
extern int yyparse();
void yyerror(const char *msg);

%}

%token EOL
%token NUM
%token PLUS
%token MINUS
%token TIMES
%token DIV
%token LPAREN
%token RPAREN
%token ASSIGN
%token COMMA
%token IDENT
%token STRING
%token PRINT
%token CONCAT
%token LENGHT
%token COMMENT

%token ERROR

/* precedência e associatividade */
%left PLUS MINUS
%left TIMES DIV

%start program

%%

/* programa */
program
: stmt_list
;

stmt_list
: stmt
| stmt_list stmt
;

stmt
: IDENT ASSIGN expr
| PRINT LPAREN exprlist RPAREN
| COMMENT
| expr
;

exprlist
: expr
| expr COMMA exprlist
;


expr
: expr PLUS expr
| expr MINUS expr
| expr TIMES expr
| expr DIV expr
| LPAREN expr RPAREN
| CONCAT LPAREN exprlist RPAREN
| LENGHT LPAREN term RPAREN
| term
;

term
: NUM
| IDENT
| STRING
;

%%
