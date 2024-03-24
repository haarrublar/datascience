## Removing layers

Consider the model is constructed already. The pop method used by list and Numpy appears again.

There must be said that the pop method works in the variable model itself. For instance, _model = keras.Sequential(...)_ not in model.layers method.

The _model.layers_ method returns a copy of the model, and in that copy the last layer is removed not in the actual model

```python
# remove the last layer in the model
model.pop()
```

**NOTE**: To remove the last layer in the copy of the actual model _USE JUST FOR VISUALIZING WHICH LAYER IS REMOVED NOT FOR REAL CHANGES IN THE MODEL_

```python
model.layers.pop()
```
