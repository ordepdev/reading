-module(shop).
-export([total/1]).

cost(oranges)   -> 5;
cost(newspaper) -> 8;
cost(apples)    -> 2;
cost(pears)     -> 9;
cost(milk)      -> 7.

total([])               -> 0;
total([{Product, N}|T]) -> cost(Product) * N + total(T).
