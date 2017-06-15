+++
categories = []
date = "2017-01-04T09:27:41-05:00"
tags = []
title = "jit"

+++

Just-in-time (JIT) compilation is a popular compiler performance optimization.
From what I can tell, it's built around profiling runtime behavior, then
converting "hotspots", or frequently-used code areas, into optimized machine
code.

In case you, and "you" here also means future me, have forgotten, languages are
not always directly converted into machine code, encoded in binary.  as the
exact format is platform-dependent. Instead, code often gets compiled down to an
intermediate representation called 'bytecode', which is then _interpreted_ by a
virtual machine (a la the JVM, Python's VM, the [LLVM], etc.) into the actual
machine code. The bytecode contains instructions and values, all the necessary
information to be picked up for further conversion.

For when I return to research on compilers and JIT specifically, here's some
resources:

__Compilers__
- [Assembly vs. Machine Code]
- [Overview of Python's VM]. The first %15 is also an excellent refresher on the
  lex,parse,compile->bytecode process in general.
- [SO answer on how a lexer and parser are _similar_]
- [Writing a Python VM]

__JIT__
- [How & Why JIT works]
- [More on JIT tracing]

[Assembly vs. Machine Code]: http://stackoverflow.com/questions/466790/assembly-code-vs-machine-code-vs-object-code
[Overview of Python's VM]: https://www.toptal.com/python/why-are-there-so-many-pythons
[Writing a Python VM]: http://aosabook.org/en/500L/a-python-interpreter-written-in-python.html
[How & Why JIT works]: https://morepypy.blogspot.com/2009/03/applying-tracing-jit-to-interpreter.html
[More on JIT tracing]: https://andreasgal.com/2008/08/22/tracing-the-web/
[SO answer on how a lexer and parser are _similar_]: http://stackoverflow.com/a/3614928/2246784
[LLVM]: http://llvm.org/
