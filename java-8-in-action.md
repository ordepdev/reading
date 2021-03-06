# Lambda expressions

* A lambda expression can be understood as a kind of anonymous function: it doesn't have a name, but it has a list of parameters, a body, a return type, and also possibly a list of exceptions that can be thrown;
* Lambda expressions let you pass code concisely;
* A functional interface is an interface that declares exactly one abstract method;
* Lambda expressions can be used only where a functional interface is expected;
* Lambda expressions let you provide the implementation of the abstract method of a functional interface directly inline and treat the whole expression as an instance of a functional interface;
* Predicate<T>, Function<T,R>, Supplier<T>, Consumer<T> and BinaryOperator<T> are functional interfaces defined in the java.util.function package;
* The type expected for a lambda expression is called the target type;
* Method references let you reuse an existing method implementation and pass it around directly;

# Introducing Streams

* A stream is a sequence of elements from a source that supports data processing operations;
* Streams make use of internal iteration: the iteration is abstracted away through opperations such as filter, map and sorted;
* There are two types of stream operations: itermediate and terminal operations;
* Intermediate operations such as filter and map return a stream and can be chained together. They're used to set up a pipeline of operations but don't produce any result;
* Terminal operations such as forEach, count and collect return a nonstream value and process a stream pipeline to return a result;
* The elements of a stream are computed on demand.

# Working with Streams

* Filter and slicing using: filter, distinct, skip and limit methods;
* Extract or transform elements of a stream using the map and flatmap methods;
* Find elements in a stream using: findFirst and findAny. Or matching a predicate using: allMatch, noneMatch and anyMatch methods;
* This kind of methods make use of short-circuiting: a computation stops as soon as a result is found; there's no need to process the whole stream;
* Elements of a stream can be iteratively combined in order to produce a result using the reduce method;
* Operations like filter and map are stateless; they don't store any state. Others like reduce are stateful; they store state in order to calculate the result;
* An infinite stream is a stream that has no fixed size; they are created using iterate and generate methods.

# Parallel data processing and performance

* Some stream operations are more parallelizable than others.
* The iterate operation is hard to split into chunks that can be executed independently because the input of one function application always depends on the result of the previous application.
* Parallel programming can be tricky and sometimes counterintuitive. When misused it can actually worsen the overall performance of our programs.
* Numeric stream avoids all the overhead caused by all the unnecessary autoboxing and unboxing operations performed by the nonspecialized stream.
* The paralelization process itself requires to recursively partition the stream, assign the reduction operation of each substream to a different thread, and then combine the results of these operations in a single value.
* Turning a sequential stream into a parallel one is trivial but not always the right thing to do.
* A parallel stream isn’t always faster than the corresponding sequential version.
* Automatic boxing and unboxing operations can dramatically hurt performance.
* Operations such as limit and findFirst that rely on the order of the elements are expensive in a parallel stream.
* findAny will perform better than findFirst because it isn’t constrained to operate in the encounter order.
* For a small amount of data, choosing a parallel stream is almost never a winning decision.

