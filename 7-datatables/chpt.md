`data.table`
============

As you may be able to guess, `data.table` is closely related to `data.frame`.
They also work in a similar way. So then, why would we want to use `data.table`?

If you have been using R for a while you will realise that R maybe slower than
SAS for data mungling. `data.table` makes use of indexing to offer "fast
subset, fast grouping, fast update, fast ordered joins...". Since `data.table`
inherits `data.frame` it supports most R functions and packages which use `data.frame`.

## Building Keys

The key item in `data.table` is the idea of having keys. You can build keys and then
query on them.

```{.r}
class <- data.table(
  sex = sample(c("M", "F"), size=19, replace=TRUE),
  age = sample(12:16, size=19, replace=TRUE),
  height = runif(n=19, min=50, max=70),
  weight = runif(n=19, min=70, max=115)
)

class["M", ] # doesn't work
setkey(class, sex)
class["M", ] # now it works
```

You can also set multiple keys.

```{.r}
setkey(class, sex, age)
class[J("M", 12),]
```

We would use the `J` function to query based on these keys. (Note: to see all your current
tables and their keys simply type `tables()` into the console).













