library(gapminder)
library(ggplot2)
library(dplyr)

53 + 23
53 +
  23  

3 + 5 * 2
(3 + 5) * 2


log(1) # natural logarithm
log10(10) # base-10 logarithm
exp(0.5) # exponent

# variable assignment
x <- 1/40
x

log(x)

x <- 100

x <- x + 1
x

y <- x * 2
y

# naming
# periods.between.words
# underscored_between_words
# camelCaseToSeparateWords

# can't
# start with a number
# spacing


# running a code chunk
mass <- 47.5
age <- 122
mass <- mass * 2.3
age <- age - 20
mass
age

# vectorization
1:5

2^(1:5)

x <- 1:4
y <- 5:8

x + y

# manage our environment
ls()

rm(age)
ls()

rm(list = ls())
ls()

# R packages
installed.packages()

update.packages("packagename")

install.packages("gapminder")

library(gapminder)


# getting help
help(ls)
?ls
?rm


# fuzzy search
??read.ta

vignette()
vignette("coin")


# stack overflow:
?dput
sessionInfo()


# Data Structures
# make a data frame
cats <- data.frame(coat=c("calico", "black", "tabby"), 
                   weight =c(2.1, 5.0, 3.2),
                   likes_string=c(1, 0, 1))
cats
cats$weight
cats$coat
cats$weight+2
cats$weight+cats$coat
class(cats$weight)
class(cats$coat)
str(cats)
str(cats$coat)
cats$coat
#change order of factors (default alphabetical)
cats$coats_reorder <- factor(x=cats$coat, 
                            levels= c("tabby", "calico", "black"),
                            ordered = TRUE)
write.csv(x=cats, file = "data/feline_data.csv")
str(cats$coats_reorder)
levels(cats$coats_reorder)
#exploring data frames
#read in data
gap <- read.csv(file = "data/gapminder-FiveYearData.csv")
cats <- read.csv(file = "data/feline_data.csv")
head(gap)
str(gap)
nrow(gap)
ncol(gap)
dim(gap)
colnames(gap)
# subsetting data
x <- c(5.4, 6.2, 7.1,4.8, 7.5)
names(x) <- c("a", "b", "c", "d", "e")
x
x[1]
x[3]
x[c(1,3)]
x[1:4]
x[-2]
x[-(2:4)]
x[-2:-4]
# subsetting gapminder data
head(gap[1])
head(gap["pop"])
head(gap[, 1])
gap[3, ] #subset by row
gap[138, ]
albania <- gap[13:24, 3:6]
afghanistan <- gap[1:12, 1:6]
afghanistan$gdp <- gap[1:12, 3]*gap[1:12, 6]
#alternate      afghan$pop*afghan$gdpPercap  
write.csv(x=afghanistan, file = "results/afghanistan_subset.csv")
