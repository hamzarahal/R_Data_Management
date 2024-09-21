#######################package installation################################
install.packages("tidyverse")
install.packages("datasets")
install.packages("ggplot2")
available_pkgs <- available.packages()
available_pkgs
print(available_pkgs[, c("Package", "Description")], row.names = FALSE)

########################### Loading Library ##############################
library(tidyverse)
library(dplyr)
library(stringr)
library(ggplot2)

############### to know about a specific package or any term #############
??tidyverse

#The summary() function provides a statistical summary of each variable in the "iris" dataset, including minimum, 1st quartile, median, mean, 3rd quartile, and maximum values.
summary(iris)

## to know the overall information about the dataset
help(iris)
#0r
?iris

## Code to compute solution to quadratic equation of the form ax^2 + bx + c
## define the variables
a <- 3
b <- 2
c <- -1
d = 8
e = 5
f = 5
###############################OPERATORS#####################################
#can be used as a calculator
a+d
a-d
a/d
a*d

#EXPONENTIATION ^ / ** 
4^2
2**2

#MODULUS/ REMAINDER
#x %% y	modulus (x mod y)
5%%2

#EQUAL, LESS THAN, GREATER THAN
a>b
c>=b
d<=e
e>=f
e!=d

#x | y	x OR y
#x & y	x AND y
#isTRUE(x)	test if X is TRUE
x <- c(1:10) #gives numbers from 1 to 10 include 1 and 10
seq(1,20)
x
x[(x>8) | (x<5)]#display only numbers which are greater than 8 and less than 5
x > 8 | x < 5 

#Quadractic Equations
(-b + sqrt(b^2 - 4*a*c)) / (2*a)
(-b - sqrt(b^2 - 4*a*c)) / (2*a)

#Numericfunction
#abs(x)	absolute value
#sqrt(x)	square root
#ceiling(x)	ceiling(3.475) is 4
#floor(x)	floor(3.475) is 3
#trunc(x)	trunc(5.99) is 5
#round(x, digits=n)	round(3.475, digits=2) is 3.48
#signif(x, digits=n)	signif(3.475, digits=2) is 3.5
#cos(x), sin(x), tan(x)	also acos(x), cosh(x), acosh(x), etc.
#log(x)	natural logarithm
#log10(x)	common logarithm
#exp(x)	e^x



#how to access external data
##csv file
data <- read.csv("path/to/your/file.csv")

##Excel File
install.packages("readxl")  # Install the package if needed
library(readxl)  # Load the package
data <- read_excel("path/to/your/file.xlsx")

##Web data
url <- "https://example.com/data.csv"
data <- read.csv(url)

##SQL Database
install.packages("RSQLite")  # Install the package if needed
library(RSQLite)  # Load the package

###############Creating DataFrame###########################################

##########df################
df <- data.frame(
  id = c(10,11,12,13,14,15,16,17),
  name = c('sai','ram','deepika','sahithi','kumar','scott','Don','Lin'),
  gender = c('M','M','F','F','M','M','M','F'),
  dob = as.Date(c('1990-10-02','1981-3-24','1987-6-14','1985-8-16',
                  '1995-03-02','1991-6-21','1986-3-24','1990-8-26')),
  state = c('CA','NY',NA,NA,'DC','DW','AZ','PH'),
  row.names=c('r1','r2','r3','r4','r5','r6','r7','r8')
)

df

###########Missing Values###############################

na.omit(df) #row-wise delete missing values in your dataset
#or
na.exclude(df)

is.na(df) # allows you to logically test for NA values.

#to count number of rows with na
rows_with_na <- sum(is.na(df))
rows_with_na

#to count number of columns with na
columns_with_na <- colSums(is.na(df))
columns_with_na
##dplyr::filter()
# Load dplyr library
library('dplyr')

# filter() by row name
df %>% filter(rownames(df) == 'r3')
# filter() by column Value
df %>% filter(gender == 'M')
# filter() by list of values
df %>% filter(state %in% c("CA", "AZ", "PH"))
# filter() by multiple conditions
df %>% filter(gender == 'M' & id > 15)

##dplyr::select() Examples
# select() single column
df %>% select('id')
# select() multiple columns
df %>% select(c('id','name'))
# Select multiple columns by id
df %>% select(c(1,2))


########slicing####################
##dplyr::slice() Examples
# Create a vector
my_vector <- c(1, 2, 3, 4, 5, 6)
# Extract elements at index 2, 4, and 6
sliced_vector <- my_vector[c(2, 4, 6)]
sliced_vector
# Create a matrix
my_matrix <- matrix(1:9, nrow = 3)
my_matrix
# Extract the second row
sliced_row <- my_matrix[2, ]
sliced_row
# Extract the first and third columns
sliced_cols <- my_matrix[, c(1, 3)]
sliced_cols
# Extract a specific element
specific_element <- my_matrix[2, 3]

# Create a data frame
my_df <- data.frame(
  name = c("Alice", "Bob", "Charlie"),
  age = c(25, 30, 22),
  gender = c("F", "M", "M")
)
my_df

# Extract the first two rows
sliced_rows <- my_df[1:2, ]
# Extract the "name" and "age" columns
sliced_cols <- my_df[, c("name", "age")]
# Extract a specific cell
specific_cell <- my_df[2, "gender"]


# Select rows 2 and 3
df %>% slice(2,3)
# Select rows from list
df %>% slice(c(2,3,5,6))
# select rows by range
df %>% slice(2:6)
# Drop rows using slice()
df %>% slice(-2,-3,-4,-5,-6)
# Drop by range
df %>% slice(-2:-6)

##########INDEXING#################################

# Example 1: Indexing a Vector
my_vector <- c(10, 20, 30, 40, 50)
# Access a single element using index 3
element <- my_vector[3]  # Output: 30
# Access multiple elements using indices 1, 3, and 5
elements <- my_vector[c(1, 3, 5)]  # Output: 10 30 50
# Example 2: Indexing a Matrix
my_matrix <- matrix(1:9, nrow = 3)
# Access the element in the second row and third column
element <- my_matrix[2, 3]  # Output: 6
# Access the first and third rows of the matrix
row_subset <- my_matrix[c(1, 3), ]  # Output:
#     [,1] [,2] [,3]
# [1,]    1    4    7
# [2,]    3    6    9

# Access the second and third columns of the matrix
column_subset <- my_matrix[, c(2, 3)]  # Output:
#     [,1] [,2]
# [1,]    2    3
# [2,]    5    6
# [3,]    8    9

# Example 3: Indexing a Data Frame
my_df <- data.frame(a = c(1, 2, 3), b = c("A", "B", "C"))
# Access column 'a' of the data frame
column_a <- my_df$a  # Output: 1 2 3
# Access column 'b' of the data frame
column_b <- my_df[, "b"]  # Output: "A" "B" "C"
# Access the element in the second row and first column of the data frame
element <- my_df[2, 1]  # Output: 2


##dplyr::mutate() Examples
# Replace on selected column
df %>% 
  mutate(name = str_replace(name, "sai", "SaiRam"))

##dplyr::rename() Examples
#Change the column name - c1 to id
df %>% 
  rename("c1" = "id")
# Rename multiple columns by name
df <- df %>% rename(c1 = id, fname = name, g = gender) # Rename multiple columns by index
df

# Sort the data frame by id in ascending order
sorted_df <- arrange(df, id)

# Sort the data frame by id in descending order
sorted_df <- arrange(desc(id))
sorted_df

# Sort the data frame by age in ascending order and name in descending order
sorted_df <- arrange(df, age, desc(name))



#plotting
# Bar plot for gender distribution
ggplot(df, aes(x = gender)) +
  geom_bar() +
  labs(title = "Gender Distribution", x = "Gender", y = "Count")

###CHEAT SHEET(check folder)

##dplyr::distinct()
#########df1################################################################################
################################Activity#***********
# Create dataframe
df1 = data.frame(id=c(11,11,33,44,44),
                 pages=c(32,32,33,22,22),
                 name=c("spark","spark","R","java","jsp"),
                 chapters=c(76,76,11,15,15),
                 price=c(144,144,321,567,567))
df1

# Load library dplyr
library(dplyr)
# Distinct rows
df2 <- df1 %>% distinct()
df2
# Distinct on selected columns
df2 <- df1 %>% distinct(id,pages)
df2

##dplyr::arrange()


############df3##############
# Create Data Frame
df3=data.frame(id=c(11,22,33,44,55),
               name=c("spark","python","R","jsp","java"),
               price=c(144,NA,321,567,567),
               publish_date= as.Date(
                 c("2007-06-22", "2004-02-13", "2006-05-18",
                   "2010-09-02","2007-07-20"))
)

# Using arrange in ascending order
df2 <- df3 %>% arrange(price)
df2

##dplyr::group_by()
# group_by() on department
grp_tbl <- df1 %>% group_by(pages)
grp_tbl
# summarise on groupped data.
agg_tbl <- grp_tbl %>% summarise(sum(price))
agg_tbl

#Merging and combining data

new.data <- merge(df3, df1, by="price")

new.data



data("iris")
head(iris, 6)

logical <- c(TRUE, FALSE, TRUE)
num <- as.numeric(logical)
num

###ACTIVITY###
#checking dimension
dim(iris)

# map data to x and y coordinates
ggplot(data = iris) +
  aes(x = Petal.Length, y = Petal.Width)

# add data points
ggplot(data = iris) +
  aes(x = Petal.Length, y = Petal.Width) +
  geom_point()

# change color & symbol type
ggplot(data = iris) +
  aes(x = Petal.Length, y = Petal.Width) +
  geom_point(aes(color = Species, shape = Species))

# add trend line
ggplot(data = iris) +
  aes(x = Petal.Length, y = Petal.Width) +
  geom_point(aes(color = Species, shape = Species)) +
  geom_smooth(method = lm)

#boxplot
ggplot(data = iris) +
  aes(x = Species, y = Sepal.Length, color = Species) +
  geom_boxplot()

