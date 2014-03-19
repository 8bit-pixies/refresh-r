R on Training Wheels
====================

Now the key question is:

> What is the fastest way I can do something in R?

Now since SQL is a universal language, it wouldn't surprise you that there is
something similar to `proc sql`. 

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

Ignoring the first step, just considering the function `sqldf` I'm sure
this will cover most of the common tasks you may encounter (though
not necessarily in the most efficient manner).

