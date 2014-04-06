library(reshape2)

class <- data.frame(
  sex = sample(c("M", "F"), size=19, replace=TRUE),
  age = sample(12:16, size=19, replace=TRUE),
  height = runif(n=19, min=50, max=70),
  weight = runif(n=19, min=70, max=115)
)

class_ <- melt(class, id=c('sex'), measured=c('age', 'weight', 'height'))
dcast(class_, sex ~ variable, mean)

# Using the example from [here](http://www.ats.ucla.edu/stat/sas/modules/ltow_transpose.htm)

long1 <- data.frame(
  famid = rep(1:3, each=3),
  year = rep(96:98, 3),
  faminc = c(40000, 40500, 41000, 45000, 45400, 45800, 75000, 76000, 7700)
  )

l1m <- melt(long1, id=c("famid", "year"), measure=c("faminc"))
dcast(l1m, famid+variable ~ year)

