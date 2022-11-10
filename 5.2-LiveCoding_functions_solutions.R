
# Functions

## Let's create a function that receives a random number as an input parameter 
## and returns it raised to the cube:
my.func <- function(number){
  result <- number ^ 3
  return (result)
}

## Call the function:
x1 = round(runif(1,1,10)); x1
a <- my.func(x1);a


## Slight modification to receive two numbers as input parameters of the function.
## Let's create a function that receives two random numbers as input parameters 
## and returns the first argument raised to the second:
my.func <- function(x,y){
  return (x ^ y)
}

## For calling the function:
x2 = round(runif(1,1,3)); x2

## These 3 syntax produces the same output:
## Positional arguments:
a <- my.func(x1,x2);a
## Keyword arguments:
a <- my.func(y=x2,x=x1);a
a <- my.func(x=x1,y=x2);a

## But is different from:
a <- my.func(y=x1,x=x2);a


## Slight modification: Add a default value for the previous function:
my.func <- function(x,y=2) return (x ^ y)

a <- my.func(x=x1); a
a <- my.func(x=x1,y=x2); a


## Slight modification: Return more than one value?
my.func <- function(x,y=2){
  result <- x ^ y
  addition <- x+y
  return (result,addition)
}

variable <- my.func(3)

## How would I get more than one return in a function?
my.func <- function(x,y=2) return ( c(x^y,x+y) )
variable <- my.func(3);variable
length(variable)
typeof(variable)

## Create a function that extracts the maximum and the minimum 
## into a in a convenient data structure:

# Activate this when discussing variables environment.
# is.local <- 0
min.max <- function(my.vec){
  my.list <- list()
  
  my.list$min <- min(my.vec)
  my.list$max <- max(my.vec)
#  is.local <- 1
  return (my.list)
}

result <- min.max(c(100, 20, 34, 0, -8))
result
## Why I cannot access to this object?
my.list$min
ls()
## Let us remove all objects from my environment:
rm(list = ls())
## Run the function and result object.
ls()
## As you can see, my.list or my.vec do not live in my global environment!
## The same with the is.local = 1 object.
is.local
## Local variables exist only within a certain part of a program like a function, 
## and is released when the function call ends.

## Then, we can access to
result$min
result$max
## As you can see, my.list does not live in the Global Environment, however
## the function min.max does!

# More than one return:
## Return a tring indicating whether a word starts with a consonant, open or 
## closed vowel:
library(data.table)
# Check the %like% operator:
starts.with <- function(a.string){
  a.string <- tolower(a.string)
  if (grepl("^[aeo]",a.string)) return('Starts with open vowel')
  else if (a.string %like% "^[iu]") return('Starts with close vowel')
  else if (a.string %like% "[nst]$") return('Ends with a n,s or t')
  else if (a.string %like% ".x.") return('The word has an x')
  else return('The word has nothing')
}

starts.with("apendix")
starts.with("Upendix")
starts.with("pendixt")
starts.with("pendix")
starts.with("pendixo")


# And this is my excuse to talk about the Infix Operators!
## Most of the operators that we use in R are binary operators (having two operands). 
## Hence, they are infix operators, used between the operands. For instance,
5+3
## is in fact
`+`(5,3)
## Actually, these operators do a function call in the background.

## It is possible to create user-defined infix operators in R. 
## This is done by naming a function that starts and ends with %.
`%divisible%` <- function(x,y){
  if (x%%y ==0) return (TRUE)
  else          return (FALSE)
}

## This function can be used as infix operator:
10 %divisible% 2
## or as a function call:
`%divisible%`(11, 2)
## Both are the same.



