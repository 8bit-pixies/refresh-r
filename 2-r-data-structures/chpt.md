Data Structures
===============

Vectors
-------

The power of R comes from vectors. Infact vectorization is the single most important
idea in producing efficient R code.

What does an R vector look like?

~~~{.r}
vec <- c(1, 2, 3, 4)
~~~

Lets break down what we can see here first:

* `vec` : this is our variable
* `<-` : this is our assignment (in fact the statement could have been written as `vec = c(1,2,3,4)`
* `c` : this is a function
* `1,2,3,4` : these are the arguments in the function

So far, this isn't anything too different from what we have seen in SAS.

In plain english, what the statement above does is:

> Assigns a vector of numbers (1,2,3,4) into the variable `vec`

You may be curious, what is the function `c`. To answer that question, simply type `?c`
into the console. You will see in the help screen that `c` is function which forms a vector.
Some people refer to the function `c` as the "concatentation" function. To see why, we can
extend this vector by writing

~~~{.r}
c(vec, 5)
~~~

which will return the vector (1,2,3,4,5) which is the vector above with 5 
concatentated onto it.

You can access elements in a vector by their index:

~~~{.r}
vec[1]
~~~

If you want to initialise vectors, you can simply type 

~~~{.r}
vec <- numeric(10)
~~~

And it will generate a vector of size 10.

### Notes

* Elements in a vector must all be of the same type. try `vec <- c(1, "abc"); class(vec)`, and it will be a character vector
* To initialise large vectors it is best to "pre-build" them. It is much faster than "growing" a vector. 

Lists
-----

List can hold functions, and data of _different_ types.

~~~{.r}
list(1, "s", sum)
~~~

Lists are similar to hash tables or dictionaries in other programming language.
They are similar to vectors except you can access elements by calling its index.

~~~{.r}
ls <- list('a'=1, 'b'="s", 'func'=sum, 'ls'=list(1,2,3,"c"))
ls$a
ls['b']
ls$ls[[1]]
~~~

DataFrames
----------

This is the R version of the SAS dataset. DataFrames are really just a special
version of a list. Infact, DataFrame is more or less just a "list of lists".

~~~{.r}
ls <- list('a'= c(1,2,3,4), 'b'=c("a","b","c","d"))
dls <- data.frame(ls)
dls$a
dls$b
~~~

Concluding Remarks
------------------

Data structures are a extremely deep topic in R, and a complicated one too.
Here I have merely given you an overview of them, but a deep understanding of how
they work, and the most efficient way to approach them is necessary to create efficient
R code.




