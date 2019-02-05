/*
*  Search through source flagging any
*  occurrances of pattern (a|b)*abb
*  found.
*
*  By default, unmatched fragments 
*  of input are echoed verbatim to output.
*  Final two rules surpress this, by 
*  gobbling up every char not matched 
*  by the main rule.
*
*  With %standalone option, generated code 
*  includes a main method.
*
*  %class option creates Search.java insead of Yylex.java.
*
*  For each match found, prints text mattched and its 
*  position within the input file.
*
*  yytext(): the text fragments that matches the pattern
*  yyline: the line number (need %line option to enable this)
*
*  To run: 
*
*  jflex search1.flex
*  javac Search.java
*  java Search test.txt
* 
*  
*
*/

%%
%class Search
%standalone
%line
%column
%%
(a|b)*abb   {System.out.printf(
			"*** found match [%s] at l%d, c%d\n ",
			yytext(), yyline, yycolumn);
			}
\n          { /* do nothing */}
.           { /* do nothing */}
