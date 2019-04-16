The C pre-processor (cpp) is a macro processor that is used automatically by the C compiler to expand macros and included header files:

`cpp sum.c > sum.i`

Next is the compilation of pre-processed source program to assembly language. The command-line option -S tells gcc to convert the preprocessed C source code to assembly language without creating an object file:

`gcc -Wall -S sum.i`

The goal of the assembler is to convert assembly language into machine code and generate an object file. The assembler can be invoked with the following command line:

`as sum.s -o sum.o`

The final step of compilation is the linking of object files to create an executable. The entire linking process is handled transparently by gcc when invoked as follows:

`gcc sum.o`

This links the object file 'sum.o' to the C standard library, and produces an executable file 'a.out', which can be run as:

`./a.out`

The `file` command displays some of the characteristics of the object file or executable, such as whether it was compiled with dynamic or static linking.

`file a.out`

Executables and object files can contain a symbol table, which table stores the location of functions and variables by name, and can be displayed with the `nm` command:

`nm a.out`

The command `ldd` displays a list of the shared libraries that an executable needs, if any.

`ldd a.out`
