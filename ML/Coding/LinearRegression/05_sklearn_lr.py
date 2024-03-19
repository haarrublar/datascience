"""
sklearn does not include statistical insights about the linear regression method. Indeed, it is made to perform as faster as possible and not for statistical measures.
"""

from sklearn import linear_model

# check if the variables needs a reshape for processing .fit method within the sklearn library
X_train , X_test = X_train[:,1].reshape(-1,1) , X_test[:,1].reshape(-1,1)
y_train , y_test = y_train.reshape(-1,1) , y_test.reshape(-1,1)


# apply the linear model function, fit and make predictions from the fitting results.
lm = linear_model.LinearRegression()
lm.fit(check , y_train)
y_predict = lm.predict(X_test)