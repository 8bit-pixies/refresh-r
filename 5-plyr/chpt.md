plyr
====

In the previous section, we looked at idiomatic R. Now perhaps you may have tried

```{.r}
?apply
```

Read the help and possibly find it difficult to understand or strange to code in this
fashion. A series of popular packages by Hadley Wickham hope to make it easier.

The following family of packages all rely on the "split-apply-combine" ideology, which
you can read [here](http://www.jstatsoft.org/v40/i01). 

Firstly, to install the `plyr` package, follow the instructions [here](http://plyr.had.co.nz/).

No more `by`
------------

`plyr` single-handedly replaces the `by` functionality in SAS; whether it be in `proc` or `data` steps.
But in order to do that, the "split-apply-combine" ideology is used, which is different but more structured
way of approaching data analytics.

**Example**: Suppose we wanted to find the average weight, height and age for a dataset similar to `sashelp.class`.
In SAS the solution would look like:

```{.sql}
proc sort data = sashelp.class out=class;
    by sex;
run;

proc means data = class;
    by sex;
    var age height weight;
    output out=class_means mean=avg_age avg_height avg_weight;
run;
```

In R, the solution using `plyr` (including a simulated dataframe):

```{.r}
library(plyr)

class <- data.frame(
  sex = sample(c("M", "F"), size=19, replace=TRUE),
  age = sample(12:16, size=19, replace=TRUE),
  height = runif(n=19, min=50, max=70),
  weight = runif(n=19, min=70, max=115)
  )

ddply(class, .(sex), summarize,
      avg_age = mean(age),
      avg_height = mean(height), 
      avg_weight = mean(weight))
```

R also supports defining your own functions. So the solution above could also be written as:

```{.r}
ddply(class, .(sex), function(x) data.frame(mean(x$age), mean(x$height), mean(x$weight)))
```

How does that statement actually work? Well, under tthe "split-apply-combine" idea, the dataframe
is split up by `sex` and the function is applied ontop of each split. Then it is stacked together
with `sex` as the label of each group.

`dplyr`
-------

A rewrite of `plyr` has recently been completed called `dplyr`. It uses slightly different
grammar, but the idea is the same. At the same time it promises a speedup compared with
`plyr`. 

The idea is this:

1. perform the "group by" portion using the `group_by` function ("split")
2. use the `summarise` function ("apply")
3. `arrange` ("combine")

