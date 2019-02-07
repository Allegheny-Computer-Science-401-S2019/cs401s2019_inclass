/*
To build and run:
	jflex tiny_scanner.flex
	javac TinyScanner.java
	java TinyScanner Factorial.tiny
*/

%%
%class TinyScanner
%standalone

// definitions
digit = [0-9]
number = {digit}+
letter = [a-zA-Z]
identifier = {letter}+
newline = \n
whitespace = [ \t]+
comment = \{[^}]*\} //"{"[^"}"]*"}" 

%%
"if"
	{ System.out.println("IF") ; }
"else"
	{ System.out.println("ELSE") ; }
"then"
  { System.out.println("THEN"); }
"until"
  { System.out.println("UNTIL"); }
"repeat"
  { System.out.println("REPEAT"); }
"end"
	{ System.out.println("END") ; }
":="
	{ System.out.println("ASSIGN") ; }
"="
	{ System.out.println("EQ") ; }
"<"
	{ System.out.println("LT") ; }
"<="
	{ System.out.println("LEQ") ; }
"-"
  { System.out.println("MINUS"); }
"*"
  { System.out.println("MULT"); }
"("
  { System.out.println("OPENPAREN"); }
")"
  { System.out.println("CLOSEPAREN"); }
";"
  { System.out.println("SEMICOLON"); }
"read"
  { System.out.println("READ"); }
"write"
{ System.out.println("WRITE"); }
{number}
	{ System.out.printf("NUM (%d)\n",
		Integer.parseInt(yytext())) ; }
{identifier}
	{ System.out.printf("ID (%s)\n", yytext()) ; }
{whitespace}
	{ /* skip whitespace */ }
{comment}
	{ /* skip comments */ }
{newline}
	{ /* skip new lines */ }
.
	{ System.out.printf("Unknown Symbol (%s)\n", yytext()); }
