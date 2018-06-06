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

# Variables

> Erlang has single-assignment variables. As the name suggests, they can be
given a value only once. If you try to change the value of a variable once it
has been set, then you’ll get an error (in fact, you’ll get the badmatch error
we just saw). A variable that has had a value assigned to it is called a bound
variable; otherwise, it is called an unbound variable.

> The scope of a variable is the lexical unit in which it is defined. So, if X
is used inside a single function clause, its value does not “escape” to outside
the clause. There are no such things as global or private variables shared by
different clauses in the same function. If X occurs in many different functions,
then all the values of X are unrelated.

> In Erlang, = is a pattern matching operation. Lhs = Rhs really means this:
evaluate the right side (Rhs), and then match the result against the pattern on
the left side (Lhs).

> In Erlang, there is no mutable state, there is no shared memory, and there
are no locks. This makes it easy to parallelize our programs.

> If you use a conventional programming language such as C or Java to program
a multicore CPU, then you will have to contend with the problem of shared
memory. In order not to corrupt shared memory, the memory has to be locked
while it is accessed. Programs that access shared memory must not crash while
they are manipulating the shared memory.

> Using immutable variables simplifies debugging. To understand why this is
true, we must ask ourselves what an error is and how an error makes itself
known.

# Floating-Point Numbers

> In Erlang when you divide two integers with /, the result is automatically
converted to a floating-point number.

```erl
1> 5/3.
1.6666666666666667

2> 4/2.
2.0

3> 5 div 3.
1

4> 5 rem 3.
2

5> 4 div 2.
2
```
# Tuples

> To make it easier to remember what a tuple is being used for, it’s common to
use an atom as the first element of the tuple, which describes what the tuple
represents. So, we’d write {point, 10, 45} instead of {10, 45}, which makes
the program a lot more understandable.

> If we want to extract some values from a tuple, we use the pattern
matching operator =.

```erl
1> Point = {point, 10, 45}.
{point, 10, 45}.

2> {_, X, Y} = Point.
{point,10,45}

3> X.
10

4> Y.
45

5> Person={person,{name,joe,armstrong},{footsize,42}}.
{person,{name,joe,armstrong},{footsize,42}}

6> {_,{_,Who,_},_} = Person.
{person,{name,joe,armstrong},{footsize,42}}

7> Who.
joe
```

> The symbol _ is called an anonymous variable. Unlike regular variables,
several occurrences of _ in the same pattern don’t have to bind to the same
value.

# Lists

> We call the first element of a list the head of the list. If you imagine
removing the head from the list, what’s left is called the tail of the list.

> As with everything else, we can extract elements from a list with a pattern
matching operation. If we have the nonempty list L, then the expression
[X|Y] = L, where X and Y are unbound variables, will extract the head of the
list into X and the tail of the list into Y.

```erl
1> List = [1,2,3,4,5].
[1,2,3,4,5]

2> [Head|Tail] = List.
[1,2,3,4,5]

3> Head.
1

4> Tail.
[2,3,4,5]
```
