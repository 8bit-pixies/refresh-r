reshape
=======

Reshape is another library in the same group. The purpose of reshape
is to alter the dimensions of a dataframe, much like `proc transpose`
in SAS.

To install it follow the instructions located [here](http://had.co.nz/reshape/)
`reshape2` consists of a simple idea:

1. First you `melt` your data
2. Then you `cast` it into the appropriate shape

However, the `reshape` package does not approach this problem in exactly the same way.

Lets consider the example in the `plyr` chapter. This problem can be approached in the
reshape package as well.

```{.r}
library(reshape2)

class <- data.frame(
  sex = sample(c("M", "F"), size=19, replace=TRUE),
  age = sample(12:16, size=19, replace=TRUE),
  height = runif(n=19, min=50, max=70),
  weight = runif(n=19, min=70, max=115)
)

class_ <- melt(class, id=c('sex'), measured=c('age', 'weight', 'height'))
dcast(class_, sex ~ variable, mean)
```

Here we can see the two steps. First we `melt` the dataframe, and then use `cast`. (Note:
`dcast` is for casting to dataframes, while `acast` would cast to an array, useful when
the output of cast is multi-dimensional).

## An Example with SAS

Consider a typical proc transpose:

```{.sql}
proc sort data = sashelp.class out=class (drop=name);
    by sex;
run;

proc transpose data = class out=class_;
    by sex;
    var age;
run;
```

This can be approached in R in the following manner. Note that it is not a "word for word"
translation, but merely how it may be approached in R.

```{.r}
library(reshape2)

class <- data.frame(
  sex = sample(c("M", "F"), size=19, replace=TRUE),
  age = sample(12:16, size=19, replace=TRUE),
  height = runif(n=19, min=50, max=70),
  weight = runif(n=19, min=70, max=115)
)

cm <- melt(class, id=c('sex', 'age'))
dcast(cm, sex ~ variable)
```

So instead of having a ragged array, R defaults to showing how many "values" exist
for each age group instead.

