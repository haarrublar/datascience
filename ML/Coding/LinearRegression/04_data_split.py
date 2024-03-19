"""
Here our goal is spliting the whole data into training and testing data. Usually, training data takes 70% and testing data takes 30%.
"""

## manual split without using sklearn
# expliting the data between training (70%) and testing (30%)
import numpy as np

if X.shape[0] == Y.shape[0]:
    length = X.shape[0]
else:
    print('Inputs and output variables have different length')


np.random.seed(96) 
sigma = .7
X_copy, Y_copy = X.copy(), Y.copy()

np.random.shuffle(X_copy)
np.random.shuffle(Y_copy)

X_train, y_train =  X_copy[:int(length * sigma)] , Y_copy[:int(length * sigma)]
X_test, y_test = X_copy[int(length * sigma):] , Y_copy[int(length * sigma):]



# expliting the data between training (70%) and testing (30%) using sklearn
from sklearn.model_selection import train_test_split


if X.shape[0] == Y.shape[0]:
    length = X.shape[0]
else:
    print('Inputs and output variables have different length')

X_train, X_test, y_train, y_test = train_test_split(X, Y, test_size=0.3, random_state=96) 