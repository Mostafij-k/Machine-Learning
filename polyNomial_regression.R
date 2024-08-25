# Polynomial Regression

# Importing dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

# dataset very small thats why we don't need split into test and traning set.
# Don't need to feature scaling

# Fitting linear regression to the dataset, to compare with polynomial regression
lin_reg = lm(formula = Salary ~ .,
             data = dataset)
summary(lin_reg)

# Fitting polynomial regression to the dataset
dataset$Level2 = dataset$Level^2
dataset$Level3 = dataset$Level^3

poly_reg = lm(formula = Salary ~ .,
              data = dataset)
summary(poly_reg)
