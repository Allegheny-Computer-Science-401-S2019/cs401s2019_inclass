Translate to LLVM IR, generating .ll file:

`clang -S -emit-llvm sum.c`

We can also specify the target architecture and the output file's name:

`clang -target armv7h -mfloat-abi=hard sum.c -O0 -S -emit-llvm -o sum.ll`

The `opt` tool, available in the LLVM toolbox, performs machine independent optimizations. For example, we can perform optimizations on the LLVM IR by running the standard `mem2reg` pass on this IR:

`opt -passes mem2reg -S sum.ll -o sum-mem2reg.ll`

We can fold the computation of expressions that are known at compilation time with the `constprop` pass.

`opt -constprop -S sum-mem2reg.ll -o sum-const.ll`

We can also do Common Subexpression Elimination:

`opt -early-cse -S sum-const.ll -o sum-cse.ll`
