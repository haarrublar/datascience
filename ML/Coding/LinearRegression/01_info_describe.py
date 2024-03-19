"""
There might be some null data that might be clean up. Usually replaced by zero value, mean or deleting the row.
"""

# check the dataFrame data insights
dataFrame.info()
dataFrame.describe()