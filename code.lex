%{
#include "unitesLexicales.h"
%}

chiffre	 [0-9]
lettre	 [A-Za-z]


%%

[" "\t\n] {ECHO; /* rien */}
{chiffre}+ { ECHO; valNombre = atoi(yytext); return NOMBRE;};
si {ECHO;return SI;}
alors {ECHO;return ALORS;}
sinon {ECHO;return SINON;}
tantque {ECHO;return TANTQUE;}
fairerendre {ECHO;return FAIRE;}

{lettre}({lettre}|{chiffre})* {


	 
int yywrap(void){
	
	return 1;
}

ECHO; strcpy(valIdentif, yytext); return IDENTIF;}
"=="	{ECHO; return EGAL;}
"!="    {ECHO; return DIFF;}
"<="    {ECHO; return INFEG;}
">="    {ECHO; return SUPEG;}
.       {ECHO; return yytext[0];}


%%

int valNombre;
char valIdentif[256];

int yywrap(){

	return 1;

}




