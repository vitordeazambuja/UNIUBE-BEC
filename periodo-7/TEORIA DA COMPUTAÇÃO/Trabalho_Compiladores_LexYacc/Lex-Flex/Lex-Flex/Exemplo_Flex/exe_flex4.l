
ALGARISMO[0-9]
LETRA[a-zA-Z]
SINAL[+-]


%%

if {}
{LETRA} 				{}
{SINAL}{ALGARISMO}+"."{ALGARISMO}+	{printf("Numero decimal: %s", yytext);}
{SINAL}{ALGARISMO}+			{printf("Numero inteiro: %s", yytext);}
\n 					{printf("\n");}
.					{}

%%

int main(void)
{
	yylex();
	
	return 0;
}
