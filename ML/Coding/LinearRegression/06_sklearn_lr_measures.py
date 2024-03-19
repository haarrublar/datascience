from sklearn.metrics import mean_squared_error, r2_score

# The RSS calculate the difference between the observed values and the predicted values. It's value implies how "good" the model is fitting. Less RSS grather "goodness" in the model fitting.

"""
On skelearn we do not have RSS but MSE. However, checking the errors of all data entries in the resultant vector might be confusing and demanding. In that case we might observe the average, min or max. Nevertheless, the most advised is the average. This is because averaging the errors provides a single, interpretable metric that represents the overall prediction error of the model across all data points, making it easier to understand and compare the performance of different models.
"""

RSS_lm = mean_squared_error(y_test, y_predict) * y_predict.shape[0]
MSE_lm = mean_squared_error(y_test, y_predict)


"""
These measures do not involve different data points rather than themselves:
- The variance is the average (n-1) square deviation (distance from the mean). Low variance closer to the mean.
- The standard deviation is the root of the variance. Standard deviation is in the same units as the original data (not square units like variance). Gives a measure of the average distance of data points from the mean.

When we are involving a different data points to the model (linear regression) we calculate the variation of the outcome variable Y based on the input variable using R2. R2 is measure in between 0 and 1. R2 closer to 1. 
- R2~1 (suspicious - overfitting)
- R2~0.9 (great fitting - possible overfitting)
- R2~0.7 (good fitting)
- R2~0.3 (bad fitting - possible underfitting)
- R2<0 (BAD CALCULATION)

While variance and standard deviation are measures of the spread or variability within a dataset, R-squared is a measure of how well a regression model explains the variability in the dependent variable based on the independent variable(s).
"""

# R2 is the percentage of variation of Y explained by the X (the regression line - based on predicting Y from X)
lm_r2 = r2_score(y_test, y_predict)
