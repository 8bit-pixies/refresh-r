# datatables
library(data.table)

# data tables a

class <- data.table(
  sex = sample(c("M", "F"), size=19, replace=TRUE),
  age = sample(12:16, size=19, replace=TRUE),
  height = runif(n=19, min=50, max=70),
  weight = runif(n=19, min=70, max=115)
)

class["M", ] # doesn't work
setkey(class, sex)
class["M", ] # now it works

setkey(class, sex, age)
class[J("M", 12),]
