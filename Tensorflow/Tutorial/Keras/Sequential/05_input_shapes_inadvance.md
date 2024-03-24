## Layers weights dimensions

In general, Keras layers get/create their weights based on the inputs (tensors) dimensions. Then, initializing a Keras models, the layers do not have any weights.

```python
layer = layers.Dense(3)
layer.weights  # Empty
```

After calling on a tensor (input), the weights for the layer are created based on the dimension of the input. The `layer.weights` method prints out the input shape `(4,3)` and the output shape `(3,)` (the layer was previously created with 3 units of dimension for the output tensor).

```python
# Call layer on a test input
x = tf.ones((1, 4))
y = layer(x)
layer.weights  # Now it has weights, of shape (4, 3) and (3,)
```

Next, consider the Sequential model when initiated without inputs, it does not have any weight at all! Indeed, calling `model.weights` and `model.summary()` method before entering any inputs retrieves error types: `ValueError`[^1] and `ValueError`[^2] respectively.

[^1]: Weights for model 'sequential_1' have not yet been created. Weights are created when the model is first called on inputs or `build()` is called with an `input_shape`.
[^2]: This model has not yet been built. Build the model first by calling `build()` or by calling the model on a batch of data.

```python
model = keras.Sequential(
    [
        layers.Dense(2, activation="relu"),
        layers.Dense(3, activation="relu"),
        layers.Dense(4),
    ]
)
```

Let's create an input for the model to call the model and test the output.

```python
# Call the model on a test input
x = tf.ones((1, 4))
y = model(x)
print("Number of weights after calling the model:", len(model.weights))  # 6
```
