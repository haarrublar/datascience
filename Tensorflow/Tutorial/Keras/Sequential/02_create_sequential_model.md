## Sequential model

Whether the last layer of a sequential model (or any neural network model) should have an activation function depends on the problem you are trying to solve and the nature of your output.

- Regression: goal is to predict a continuous value, the output layer typically does not have an activation function.
- Binary classification: goal is to classify inputs into two classes, the output layer often uses a sigmoid activation function (activation functions retrieving binary values work).
- Multiclass classification problems: goal is to classify inputs into more than two classes, the output layer often uses a softmax activation function.

### Sequential model creation

- By using `keras.Sequential()` method:

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

- By using the `.add()` method:

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

### How does it work?

When you define a model architecture with layers like `Dense`, the layers initialize their weights randomly from a specific statistical distribution. This random initialization provides the model with a starting point for the learning process.

The purpose of this random initialization is to provide the model with a non-zero starting point for the **weights**, as starting with all zeros would make it impossible for the model to learn anything useful. During the training process, these randomly initialized weights will be updated iteratively based on the input data and the chosen optimization algorithm to minimize the loss function and improve the model's performance.

Also, you can add to the model an "input shape" before the actual Input tensor to evaluate the structure of the model at first. This method is called `layers.Input(shape,**)` used to determine the number of weights and biases that need to be initialized for each layer, not to calculate their values. The actual values of the weights are drawn randomly from the chosen initialization distribution.

For example, if you have a `Dense` layer with 4 input units and 2 output units, it will initialize a weight matrix of shape (4, 2) and a bias vector of shape (2,) with random values. The specific values in these weight tensors are not calculated from the input shape or any input data; they are simply random numbers drawn from the initialization distribution.
