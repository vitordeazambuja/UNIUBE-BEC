%{
#include <stdio.h>
#include "y.tab.h"
%}

wspc [ \t\n]+

%%
not	{ return NOT;	}
or	{ return OR;	}
and	{ return AND;	}
true 	{ return TRUE; 	}
false	{ return FALSE; }
"("	{ return AP;	}
")"	{ return FP;	}
{wspc} 	{;		}
. 	{ printf( "Caracterenaoreconhecido: %s \n " , yytext);}

%%
main()
{
	yylex();
}