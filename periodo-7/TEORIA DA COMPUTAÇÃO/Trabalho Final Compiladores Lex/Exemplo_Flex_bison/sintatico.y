%{
#include <stdio.h>
#include <stdlib.h>
%}

%token OR AND NOT
%token AP FP TRUE FALSE
%start decl

%%
decl : expr { printf("Sucesso!\n"); } ;
expr: expr OR termo
	| termo
	;
termo: termo AND fator
	| fator
	;
fator: NOT fator
	| AP expr FP
	| TRUE
	| FALSE
	;

%%
extern FILE *yyin;
main() {
do {
yyparse();
} while(!feof(yyin));
}
yyerror(char *s) {
/* Nada definido */
}