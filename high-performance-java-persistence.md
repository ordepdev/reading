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

Optimizer: 
* 

Executor:
*
