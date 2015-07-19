ARMv7 Brainfuck JIT compiler and other ASM examples
===================================================

This projects contains a number of examples written in ARM unified assembly including 
Brainfuck JIT compiler. All examples are tested on [Cubieboard2](https://en.wikipedia.org/wiki/Cubieboard#Cubieboard2)
(ARM Cortex-A7 board) running Cubian r4 (Debian Wheezy) with GCC 4.7.

Brainfuck JIT compiler
----------------------

`bfjit`([sources](https://github.com/akashche/asm_examples/blob/master/bfjit/bfjit.s)) is a limited 
JIT compiler for a subset of [Brainfuck](https://en.wikipedia.org/wiki/Brainfuck) programming language.
It supports 5 of 8 Brainfuck commands (`,`, `[` and `]` are not supported). It currently implements just-in-time
compilation only for `>` command, the same technique can be used for other commands.

ARM machine code instructions for `>` command are stored in `.data` section of ELF binary. When this
instruction is found in Brainfuck input source code `bfjit` uses [posix_memalign](http://pubs.opengroup.org/onlinepubs/009695399/functions/posix_memalign.html)
to allocate page-aligned memory and [mprotect](http://pubs.opengroup.org/onlinepubs/009695399/functions/mprotect.html)
to allow to write machine code instructions to that chunk of memory and then branch there to execute
written instructions.

[hello.bf](https://github.com/akashche/asm_examples/blob/master/bfjit/hello.bf) contains a sample
Brainfuck program that prints `HELLO ASM`.

Build and run the sample program:

    as bfjit.s -o bfjit.o
    gcc bfjit.o
    a.out < hello.bf
