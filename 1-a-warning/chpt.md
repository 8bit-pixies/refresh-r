A Warning
=========

There are many pieces of criticisms on R, some legitable, some not. This chapter is not an attempt
to clear this (mis)understanding, but perhaps to allow you to approach the topic of 
"high performance" R with an open mind.

Firstly, lets consider SAS. What is SAS:

*  SAS is best described as a procedural language.
*  SAS has a heavy emphasis on black box procedures.

In contrast R:

*  R is often described as object-orientated, but it definitely has many functional programming aspects in it.
*  R allows you to define your own functions.

Of course this is not a definitive list of the differences between SAS and R but in my opinion is
the most difficult one to accept. Too often when people learn a new programming language,
they refuse to embrace the opportunities and differences in the languages, but rather attempt
to enforce their own ideas and knowledge into a small and narrow box. So with that in mind, let me
emphasis the following statement.

> Procedural programming and object-orientated/function programming are extremely different.
> Writing R scripts in a procedural style will work, but often at the cost of performance.

So to prevent this, I will attempt to demonstrate idiomatic R code.

