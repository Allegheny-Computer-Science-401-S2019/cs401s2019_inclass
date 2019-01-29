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
*  To run: 
*
*  jflex search.flex
*  javac Yylex.java
*  java Yylex test.txt
* 
*/

%%
%standalone
%%
(a|b)*abb   {  System.out.println("*** found match\n");}
\n          {  /* do nothing */}
.           {  /* do nothing */} // . (dot) RE matches any char except newline
