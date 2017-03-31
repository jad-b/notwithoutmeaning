+++
date = "2015-08-17"
title = "Teaching Programming"
tags = ["programming", "learning"]
categories = ["programming"]
draft = true
+++

In the beginning, there was just data. Data is things like the number one, or
the word "Carly". Except we call words "strings". Sometimes, actually
oftentimes, we use aliases, or other names for certain pieces of data; we call
these "variables". "x = 1" means x is the variable name, and its value is "1".

Sometimes your data tells the computer what to do to other data. These get
called "procedures". Something like this:

    x = 1
    x = x + 1
    print("What is x?)
    print(x)

...is a procedure. A simple one, but still a procedure.

A procedure with a name is a "function". Our example above could be a function
called "AddOneThenPrint".

Together, data and procedures make up a program.

Some programs can be run directly off your command-line; take this Python
example: `python script.py`. That will execute, in order from top-to-bottom,
whatever code you've written in a file called `script.py`.

Some programs need to be compiled. Compilation is where another program, called
a compiler (how sensible), takes all of your source code and turns it into
machine-readable instructions.

Golang is a programming language that needs to be explicitly compiled to be run.
If you've written three Golang source code files, called `a.go, b.go, c.go`, then you can compile your program
into an executable program called `abc` with `go build -o abc a.go b.go c.go`.
It's the same code as in your source files, but now the computer can run it.

Simple programs, such as single files, that don't need to get explicitly compiled are often
called "scripts". This is mostly just colloquial jargon; it's actually still
getting compiled. This compiling is handled by the `python` program in our
example above: `python script.py`.
