# Multiple linear regression

dataset= read.csv('50_Startups.csv')

# Encoding categorical data
dataset$State = factor(dataset$State, 
                         levels= c('New York', 'California', 'Florida'),
                         labels= c(1,2,3))



#install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8)
split


training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Fitting Multiple Linear Regression to the Traing set

regressor = lm(formula = Profit ~ .,
               data = training_set)                     # Dot means all the independent variable


summary(regressor)  # Show summary

# Prediction the Test set Results
y_pred = predict(regressor, newdata = test_set)
y_pred


# Test by using only R.D.Spend

regressor = lm(formula = Profit ~ R.D.Spend,
               data = training_set)                    # R.D.Spend has more impact on Profit

y_pred2 = predict(regressor, newdata = test_set)
y_pred2

# use Administration
regressor = lm(formula = Profit ~ Administration,
                data = training_set)   

y_pred3 = predict(regressor, newdata = test_set)
y_pred3


# Administration has low statistical significance, so we use only two variable

regressor = lm(formula = Profit ~ R.D.Spend + Marketing.Spend,
                data = training_set)                    # R.D.Spend has more impact on Profit

summary(regressor)
y_pred4 = predict(regressor, newdata = test_set)
y_pred4

# Final model

regressor = lm(formula = Profit ~ R.D.Spend,
               data = training_set)                    # R.D.Spend has more impact on Profit
summary(regressor)
y_pred = predict(regressor, newdata = test_set)
y_pred






