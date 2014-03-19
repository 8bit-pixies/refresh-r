# reshape using acast

library(reshape2)

class <- data.frame(
  sex = sample(c("M", "F"), size=19, replace=TRUE),
  age = sample(12:16, size=19, replace=TRUE),
  height = runif(n=19, min=50, max=70),
  weight = runif(n=19, min=70, max=115)
)

cm <- melt(class, id=c('sex', 'age'))
dcast(cm, sex ~ variable)
