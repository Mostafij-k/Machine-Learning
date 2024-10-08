# Basic machine learning

# Data processing

# Importing the data

dataset= read.csv('Data.csv')

# Taking care of missing data

dataset$Age = ifelse(is.na(dataset$Age),
                     ave(dataset$Age, FUN = function(x) mean(x, na.rm=TRUE)),
                     dataset$Age)   # ave() compute average , FUN add function

# Same for salary
dataset$Salary = ifelse(is.na(dataset$Salary),
                     ave(dataset$Salary, FUN = function(x) mean(x, na.rm=TRUE)),
                     dataset$Salary)   # ave() compute average , FUN add function


# Encoding categorical data
dataset$Country = factor(dataset$Country, 
                         levels= c('France', 'Spain', 'Germany'),
                         labels= c(1,2,3))

# Same for purchase
dataset$Purchased = factor(dataset$Purchased, 
                         levels= c('No', 'Yes'),
                         labels= c(0,1))



# Spliting the dataset into the Training set and Test set

#install.packages('caTools')
library(caTools)
 set.seed(123)
 split = sample.split(dataset$Purchased, SplitRatio = 0.8)
split

training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)


# Feature scaling
training_set[, 2:3] = scale(training_set[, 2:3])
test_set[, 2:3] = scale(test_set[, 2:3])












