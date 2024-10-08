# Simple Linear Regression

# Data processing

# Importing the data

dataset= read.csv('Salary_Data.csv')

#install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
split


training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Fitting simple linear Regression to the Training Set
regressor = lm(formula = Salary ~ YearsExperience,
               data = training_set)

summary(regressor)

# Predicting the Test set results

y_pred = predict(regressor, newdata = test_set)

y_pred

# Visualizing the Training Set results

# install.packages('ggplot2')
library(ggplot2)

ggplot() +
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary),
             colour = 'red') +
  geom_line(aes(x=training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
             colour='blue') +
  ggtitle('Salary vs Experience (Training set)') + 
  xlab('Years of Experience') +
  ylab("Salary")


# Visualizing the Test Set results


ggplot() +
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary),
             colour = 'red') +
  geom_line(aes(x=training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            colour='blue') +
  ggtitle('Salary vs Experience (Test set)') + 
  xlab('Years of Experience') +
  ylab("Salary")














