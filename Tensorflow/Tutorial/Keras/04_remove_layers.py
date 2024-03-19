"""
Consider the model is constructed already. The pop method used by list and numpy appears again.

There must be said that the pop method works in the variable model itself. For instance, model = keras.Sequential(...) not in model.layers method.

model.layers method returns a copy of the model, and in that copy the last layer is removed not in the actual model
"""

# remove the last layer in the model
model.pop()

# remove the last layer in the copy of the actual model
# USE JUST FOR VISUALIZING WHICH LAYER IS REMOVED NOT FOR REAL CHANGES IN THE MODEL
model.layers.pop()