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

ddply(class, .(sex), fn <- function(x) data.frame(mean(x$age), mean(x$height), mean(x$weight)))
