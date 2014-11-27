%{
	#include <stdio.h>
	#include <stdlib.h> 
	int count = 0;
%} 

Keyword begin|call|const|do|end|if|odd|procedure|read|then|var|while|write
Identfier [A-Za-z]([A-Za-z0-9])*
Constant [0-9]+
Operator \+|\-|\*|\/|:=|>=|<=|\#|\=
Delimiter [\,\.\;\(\)]
WhiteSpace [" "\n\t]+

%% 

{Keyword} {count++; printf("%d\t�ؼ���\t%s\n", count, yytext);}
{Identfier} {count++; printf("%d\t��ʶ��\t%s\n", count, yytext);}
{Constant} {count++; printf("%d\t����\t%s\n", count, yytext);}
{Operator} {count++; printf("%d\t�����\t%s\n", count, yytext);}
{Delimiter} {count++; printf("%d\t���\t%s\n", count, yytext);}
{WhiteSpace} { /*nothing*/ }

%%

int main(void) 
{
	printf("���\t����\t���ʷ���\n\n");
	yyin = fopen("example.txt", "r");
    yylex();
	fclose(yyin);
	system("PAUSE");
	return 0;
}
 int yywrap()
 { 
 	return 1;
 }