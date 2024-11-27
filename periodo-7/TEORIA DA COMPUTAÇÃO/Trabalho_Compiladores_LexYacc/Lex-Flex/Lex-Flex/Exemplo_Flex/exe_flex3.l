%{
	int qtdInt= 0;
%}
IDF[a-z][a-z0-9]*
DIGITO[0-9]

%%

int	  	{printf("%s\n",yytext); qtdInt++;}
{IDF}      	{printf("Variavel: %s\n",yytext);}
{DIGITO}+  	{printf("Numero: %s\n",yytext);  }
"("		{printf("AbrePar: %s\n",yytext); }
")"		{printf("FechaPar: %s\n",yytext);}
\t	{}
\n	{}
.	{printf("Não Reconhecido: %s\n",yytext);}

%%
int main(void)
{
	yylex();
	printf("\nQuantidade de Int: %d", qtdInt);
	return 0;
}
