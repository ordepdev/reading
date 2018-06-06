>  In this book, we will learn how to describe parallel activities as sets of
communicating parallel processes. We will learn how to write concurrent programs.

# Modules

> This should be the same as the filename (excluding the .erl filename extension).
The module name must start with a small letter. Technically, the module name is an atom;

# Export Declaration

> Following the module declaration is an export declaration. The export declarations
tells which functions in the module can be called from outside the module. They are
like public declarations in many programming languages. Functions that are not in an
export declaration are private and cannot be called from outside the module.

```erl
-export([FuncName1/N1, FuncName2/N2, .....]).
```

> The square brackets [ ... ] mean “list of,” so this declaration means we want
to export a list of functions from the module.

# Spawn

> spawn is an Erlang primitive that creates a concurrent process and returns a
process identifier.

```erl
spawn(ModName, FuncName, [Arg1, Arg2, ..., ArgN])
```

> When spawn is evaluated, the Erlang runtime system creates a new lightweight
process that is managed by the Erlang system.

`spawn(person, init, ["Joe"])` will evaluate to `person:init("Joe")`.

> Modules in Erlang are like classes in an object-oriented programming language
(OOPL), and processes are like objects (or class instances) in an OOPL.

# Messages

> In Erlang, processes share no memory and can interact only with each other
by sending messages. This is exactly how objects in the real world behave.

```erl
Pid | {self(), "some message"}
```

> The syntax Pid ! Msg means send the message Msg to the process Pid. The
self() argument in the curly brackets identifies the process sending the message.

```erl
receive
    {From, Message} ->
        ...
end
```

> When the process receives a message, the variable From will be bound to the
sender process that it knows who the message came from, and the variable Message
will contain the message.

> The key point we should remember here is that our programming model is based
on observation of the real world.

# Concurrency

> Concurrent programming can be used to improve performance, to create scalable
and fault-tolerant systems, and to write clear and understandable programs for
controlling real-world applications.

> One of the most pressing problems in the computer industry is caused by
difficulties in parallelizing legacy sequential code so it can run on a
multicore computer. There is no such problem in Erlang. Erlang programs written
twenty years ago for a sequential machine now just run faster when we run them
on modern multicores.

> A concurrent program is a program written in a concurrent programming language.
We write concurrent programs for reasons of performance, scalability, or fault
tolerance.

> Concurrent programs in Erlang are made from sets of communicating sequential
processes. An Erlang process is a little virtual machine that can evaluate a
single Erlang function; it should not be confused with an operating system process.

> Having written a concurrent program, we can run it on a parallel computer. We
can run on a multicore computer or on a set of networked computers or in the cloud.

> Concurrency has to do with software structure; parallelism has to do with hardware.

> Erlang concurrency works the same way on all operating systems. To write
concurrent programs in Erlang, you just have to understand Erlang; you don’t
have to understand the concurrency mechanisms in the operating system.

# Binding

```erl
X = 1.
X = 999.
** exception error: no match of right hand side value 999
```

> We can’t rebind variables. Erlang is a functional language! Don’t worry, this
is a benefit, not a problem. Programs where variables can’t be changed once they
are set are far easier to understand than programs where the same variable can
acquire many different values during the life of the program.

> It looks as if it means “assign the integer 1 to the variable X,” but this
interpretation is incorrect. = is not an assignment operator; it’s actually a
pattern matching operator.

> Binding a variable means giving a variable a value; once it has been bound,
that value cannot be changed later.

> In an imperative language, an X in a program is really the address of some
data item somewhere in memory. When we say X=12, we are changing the value of
memory location with address X, but in Erlang, a variable X represents a value
that can never be changed.

# Loops

```erl
loop(Dir) ->
    %% wait for a command
    receive
        Command ->
            ... do something ...
            end, loop(Dir).
```

> This is how we write an infinite loop in Erlang. The variable Dir contains the
current working directory of the file server. In the loop we wait to receive a
command; when we receive a command, we obey the command and then call ourselves
again to get the next command.

> Just for the curious: Don’t worry about the fact that the last thing we do is
to call ourselves; we’re not going to run out of stack space. Erlang applies a
socalled tail-call optimization to the code, which means that this function will
run in constant space. This is the standard way of writing a loop in Erlang.
Just call yourself as the last thing you do.
