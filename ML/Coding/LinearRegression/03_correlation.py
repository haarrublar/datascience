"""
The correlation shows up the relation all the variables have each other (in pairs). 
It is a good measure to define how related/associated variables are.

It measure how two data are related (https://stats.stackexchange.com/questions/550375/what-does-correlation-formula-really-tell-you/550376#550376?newreg=c3da1b459f4b42e98f65fd61fc2b8ca0)


      -1        -       0        -      1
Strong Negative - No Correlation - Strong Positive 
"""

## the cmap depends on the user style (one or max two colors enhance the view) such as Blues, Reds, etc.
## the data frame comes from pandas DataFrame function.
corr = dataFrame.corr()
corr.style.background_gradient(cmap='Purples')