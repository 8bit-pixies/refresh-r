-   A Warning
-   Data Structures
    -   Vectors
        -   Notes
    -   Lists
    -   DataFrames
    -   Concluding Remarks
-   Programming Structures
    -   For loops
        -   Apply

A Warning
=========

There are many pieces of criticisms on R, some legitable, some not. This
chapter is not an attempt to clear this (mis)understanding, but perhaps
to allow you to approach the topic of "high performance" R with an open
mind.

Firstly, lets consider SAS. What is SAS:

-   SAS is best described as a procedural language.
-   SAS has a heavy emphasis on black box procedures.

In contrast R:

-   R is often described as object-orientated, but it definitely has
    many functional programming aspects in it.
-   R allows you to define your own functions.

Of course this is not a definitive list of the differences between SAS
and R but in my opinion is the most difficult one to accept. Too often
when people learn a new programming language, they refuse to embrace the
opportunities and differences in the languages, but rather attempt to
enforce their own ideas and knowledge into a small and narrow box. So
with that in mind, let me emphasis the following statement.

> Procedural programming and object-orientated/function programming are
> extremely different. Writing R scripts in a procedural style will
> work, but often at the cost of performance.

So to prevent this, I will attempt to demonstrate idiomatic R code.

Data Structures
===============

Vectors
-------

The power of R comes from vectors. Infact vectorization is the single
most important idea in producing efficient R code.

What does an R vector look like?

``` {.r}
vec <- c(1, 2, 3, 4)
```

Lets break down what we can see here first:

-   `vec` : this is our variable
-   `<-` : this is our assignment (in fact the statement could have been
    written as `vec = c(1,2,3,4)`
-   `c` : this is a function
-   `1,2,3,4` : these are the arguments in the function

So far, this isn't anything too different from what we have seen in SAS.

In plain english, what the statement above does is:

> Assigns a vector of numbers (1,2,3,4) into the variable `vec`

You may be curious, what is the function `c`. To answer that question,
simply type `?c` into the console. You will see in the help screen that
`c` is function which forms a vector. Some people refer to the function
`c` as the "concatentation" function. To see why, we can extend this
vector by writing

``` {.r}
c(vec, 5)
```

which will return the vector (1,2,3,4,5) which is the vector above with
5 concatentated onto it.

You can access elements in a vector by their index:

``` {.r}
vec[1]
```

If you want to initialise vectors, you can simply type

``` {.r}
vec <- numeric(10)
```

And it will generate a vector of size 10.

### Notes

-   Elements in a vector must all be of the same type. try
    `vec <- c(1, "abc"); class(vec)`, and it will be a character vector
-   To initialise large vectors it is best to "pre-build" them. It is
    much faster than "growing" a vector.

Lists
-----

List can hold functions, and data of *different* types.

``` {.r}
list(1, "s", sum)
```

Lists are similar to hash tables or dictionaries in other programming
language. They are similar to vectors except you can access elements by
calling its index.

``` {.r}
ls <- list('a'=1, 'b'="s", 'func'=sum, 'ls'=list(1,2,3,"c"))
ls$a
ls['b']
ls$ls[[1]]
```

DataFrames
----------

This is the R version of the SAS dataset. DataFrames are really just a
special version of a list. Infact, DataFrame is more or less just a
"list of lists".

``` {.r}
ls <- list('a'= c(1,2,3,4), 'b'=c("a","b","c","d"))
dls <- data.frame(ls)
dls$a
dls$b
```

Concluding Remarks
------------------

Data structures are a extremely deep topic in R, and a complicated one
too. Here I have merely given you an overview of them, but a deep
understanding of how they work, and the most efficient way to approach
them is necessary to create efficient R code.

Programming Structures
======================

`if`, `else`, `for` (`do`), all work in the same way as SAS, with their
analogous boolean operators, `&&` (`and`), `||` (`or`). Though there are
some differences.

For loops
---------

`for` loops in R doesn't have to be centered arond indices!

``` {.r}
for (el in c(5,4,6,7,8)) {
  print(el)
}
```

Notice that there isn't any reference to indices. This works for lists
as well

``` {.r}
for (el in list('a'=c(1,2,3), 'b'="s")){
  print(el)
}
```

### Apply

But R also has other ways of looping through things. This is through the
functional programming idea of "apply".

As a small detour, in mathematics, we can represent sets, like a set of
all square numbers to be like:

    {x^2, for all x in N}

This can be extended to programming.

So lets get a list of all square numbers from one to ten.

``` {.r}
v <- c()
for (i in 1:10) {
  v <- c(v, i*i)
}
```

An alternative way (and much more efficient) is to use the apply
function.

``` {.r}
sapply(1:10, function(x) x*x)
```

This is the idiomatic R way of iterating and applying functions onto a
vectorized object.
