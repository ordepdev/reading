# Batch updates

Sending multiple statements in a single request reduces the number of database roundtrips. However, response transaction time decreases.

It is common to use a relatively small batch size in order to avoid congesting the server from suddenly processing a huge batch load.

A low batch size can reduce the transaction response time.

The performance growth does not grow linearly with batch size.

A large batch size can save more database roundtrips but the overall performance gain does not increase linearly.

# Statement Caching

Main database modules: Parser, Optimizer and Executor.

Parser: 
* checks the SQL statement and ensures its validity.
* transform the SQL statement into a database-internal representation (syntax tree)
* syntax tree is the logical representation of the database objects required for fulfilling the current statement.

Optimizer: 
* decide the most efficient data fetching algorithm for a given syntax tree;
* the more time spent on finding the best execution plan, the higher the transaction response time gets.

Executor:
* is used to fetch the associated data and build the result set;
* uses the storage engine for loading data and the transaction engine to enforce the current transaction data integrity.
