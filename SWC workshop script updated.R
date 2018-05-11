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

# day 2 conditional statements, functions, ggplot

#Conditional statements

number <- 37
if (number > 100){    #if condition is true
  print("greater than 100")  #perform this function
  }else{                     #if condition is false
    print("less than 100")}   #perform alternate function
print("finished checking")

#comparison operators
#greater than >
#less than <
#equal to ==, single =is assignment operator (<-)
# not equal to !=
#greater than or equal >=
# less than <=

number <- 150
if (number > 100){    
  print("greater than 100")}

# more than one test

number <- -3
if (number > 0){
  print(1)
  }else if(number < 0)
  {print(0)}



#combine tests
number1 <- -15
number2 <- -40

if(number1 >= 0 & number2 >=0){
  print("both numbers are positive")
} else{print("at least one number is positive")
}

# or

if(number1 >= 0 | number2 >=0){
  print("at least one number is positive")
} else{print("at least one number is negative")
}

number =52
if (number >= 45 & number <= 50) {
  print("Between 45 and 50")}

# creating/using functions

fahr_to_kelvin <- function(temp){
  kelvin <- ((temp-32) *(5/9))+273.15
             return(kelvin) 
}

fahr_to_kelvin(32) #freezing point
fahr_to_kelvin(212)

kelvin_to_celcius <- function(temp){
  celcius <- temp - 273.15
  return(celcius)} 

kelvin_to_celcius(0)

#variable scope
#mixing and matching

fahr_to_celcius <- function(temp){
  temp_k <- fahr_to_kelvin(temp)
  temp_c <- kelvin_to_celcius(temp_k)
  return(temp_c)
}


#missing notes here


celcius_to_fahr <- function(temp){
  fahr <- ((temp*9/5) +32)
  return(fahr)
}

celcius_to_fahr(0)
celcius_to_fahr(100)

#making reproducible graphics

library(ggplot2)
#read in some data
gap<- read.csv("data/gapminder-FiveYearData.csv")
head(gap)
str(gap)
plot(x = gap$gdpPercap, y = gap$lifeExp)
#ggpolt image
#aes is graph aesthetics-which columns to focus on( already listed variables)
ggplot(data = gap, aes(x = gdpPercap, y = lifeExp)) + geom_point()
#geompoint-geometric point, describe what type of graph layering
ggplot(data = gap, aes(x = year, y = lifeExp)) + geom_point()
head(gap)
ggplot(data = gap, aes(x = year, y = lifeExp, by = country))+
  geom_line(aes(color = continent)) + geom_point(color = "blue")

ggplot(data = gap, aes(x = gdpPercap, y = lifeExp,))+
  scale_x_log10() +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm") +
theme_bw()+
  ggtitle("Effects of per-capita gdp on life expectancy")+
  xlab("GDP per capita ($)")+
  ylab("Life Expectency (Years)")

ggsave(file = "results/life_expectancy.pdf")
#save-use export button or function in code

#faceting

ggplot(data = gap, aes(x = gdpPercap, y = lifeExp, color = continent))+
  geom_point()+
  scale_x_log10()+
  geom_smooth(method = "lm")+
  facet_wrap(~year)
