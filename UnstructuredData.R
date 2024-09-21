string1 <- "This is a string"
string2 <- 'If I want to include a "quote" inside a string, I use single quotes'


#If you forget to close a quote, you’ll see +, the continuation character:
"This is a string without a closing quote
+ 
+ 
+ HELP I'M STUCK"
#If this happen to you, press Escape and try again!


#The most common are "\n", newline, and "\t", tab 
#You can see the complete list by requesting help on ?"'" ##

?"'"

#You’ll also sometimes see strings like "\u00b5", this is a way of writing non-English characters that works on all platforms:
x <- "\u00b5"
x

#Multiple strings are often stored in a character vector, which you can create with c():
c("I am Sujata", "I am in my 2nd year of masters", "I love cooking")

#To combine two or more strings, use str_c()
str_c("I am Sujata","I am in my 2nd year of masters")

#Use the sep argument to control how they’re separated:
str_c("I am Sujata","I am in my 2nd year of masters", sep = ",")

#String length
str_length(c("a", "R for data science", NA))
str_length(c("I am Sujata", "I am in my 2nd year of masters", "I love cooking"))

# Subsetting strings
#You can extract parts of a string using str_sub(). As well as the string, str_sub() takes start and end arguments which give the (inclusive) position of the substring:
x <- c("Apple", "Banana", "Pear")
str_sub(x, 1, 3)
#> [1] "App" "Ban" "Pea"
# negative numbers count backwards from end
str_sub(x, -3, -1)
#> [1] "ple" "ana" "ear"
#> 
#> https://r4ds.had.co.nz/strings.html