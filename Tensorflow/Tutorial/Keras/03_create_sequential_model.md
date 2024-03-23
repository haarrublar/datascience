## Sequential model

Whether the last layer of a sequential model (or any neural network model) should have an activation function depends on the problem you are trying to solve and the nature of your output.

- regression: goal is to predict a continuous value, the output layer typically does not have an activation function.
- binary classification: goal is to classify inputs into two classes, the output layer often uses a sigmoid activation function (activation functions retrieving binary values work).
- multiclass classification problems: goal is to classify inputs into more than two classes, the output layer often uses a softmax activation function.

### Sequential model creation

- By using _keras.Sequential()_ method:

```python
# the sequential model can be constructed by passing list of layers
model = keras.Sequential(
    [
        layers.Dense(2, activation="relu"),
        layers.Dense(3, activation="relu"),
        layers.Dense(4),
    ]
)
```

- By using the _.add()_ method:

```python
model = keras.Sequential()
model.add(layers.Dense(units=2, activation='relu'))
model.add(layers.Dense(units=3, activation='relu'))
model.add(layers.Dense(units=4)

# the sequential method admits name argument
#naming the method
model = keras.Sequential(name='sequential A')
model.add(layers.Dense(units=2, activation='relu'))
model.add(layers.Dense(units=3, activation='relu'))
model.add(layers.Dense(units=4)
```
