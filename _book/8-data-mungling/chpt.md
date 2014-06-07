Data Mungling
=============

How do we put all these ideas together to transform and write complex code?
Here we will look at some of the more common operations you would use day in
day out and how to best leverage them in R

`sqldf`
-------

SQL needs no introduction. Unsurprisingly R has its SQL package which works in the way
you expect. 

```{.r}
library(sqldf)

class <- data.table(
  sex = sample(c("M", "F"), size=19, replace=TRUE),
  age = sample(12:16, size=19, replace=TRUE),
  height = runif(n=19, min=50, max=70),
  weight = runif(n=19, min=70, max=115)
)

sqldf("select *
      from class
      where sex = 'M' 
        and age > 14")
```

Performing Joins
----------------

You could of course use SQL to perform your joins, but how does R normally do this?
`merge` function for `data.frame` and `merge` for `data.table` exists.

`ggplot2`
---------

"grammar of graphics" is the current standard for creating data visualisations
programmatically.

`lubridate`
-----------

date handling made easy