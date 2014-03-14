Programming Structures
======================

`if`, `else`, `for` (`do`), all work in the same way as SAS, with their
analogous boolean operators, `&&` (`and`), `||` (`or`). Though there are some
differences.

For loops
-------------------

`for` loops in R doesn't have to be centered arond indices!

~~~{.r}
for (el in c(5,4,6,7,8)) {
  print(el)
}
~~~

Notice that there isn't any reference to indices. This works for lists as well

~~~{.r}
for (el in list('a'=c(1,2,3), 'b'="s")){
  print(el)
}
~~~

### Apply

But R also has other ways of looping through things. This is through the 
functional programming idea of "apply".

As a small detour, in mathematics, we can represent sets, like a set of all square numbers to be like:

    {x^2, for all x in N}

This can be extended to programming. 

So lets get a list of all square numbers from one to ten.

~~~{.r}
v <- c()
for (i in 1:10) {
  v <- c(v, i*i)
}
~~~

An alternative way (and much more efficient) is to use the apply function.

~~~{.r}
sapply(1:10, function(x) x*x)
~~~

This is the idiomatic R way of iterating and applying functions onto a vectorized object.


