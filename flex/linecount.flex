%%
%class LineCounter
%standalone

%{
int lineno = 1;
%}

line = .*\n

%%

{line} 	{
			System.out.printf("[%5d]: %s", lineno++, yytext());
		}
