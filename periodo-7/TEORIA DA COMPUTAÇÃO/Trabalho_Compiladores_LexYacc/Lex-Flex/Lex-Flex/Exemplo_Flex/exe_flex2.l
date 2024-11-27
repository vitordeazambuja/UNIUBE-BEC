DIGIT[0-9]
IDF[a-z][a-z0-9]*
DELIM[{};,]
OPER[+-/*]
WHITESPACE[\n\t\r]

%%
"www."{IDF}"."{IDF}".br"	{ printf("%s\n", yytext); }
"www."{IDF}".br"		{ printf("%s\n", yytext); }
"+"[0-9]{13}			{ printf("%s\n", yytext); }
[0-9]{2,3}"."[0-9]"FM"
[0-9]{3,4}"AM"

{WHITESPACE}+			{ printf("%s\n", yytext); }
. 				{ printf("ERRO = %s\n", yytext); }

%%

main()
{
	yylex(); /* scanner gerado por Flex */

	return 0;
}


