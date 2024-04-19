## The sequential model

The sequential model is appropriate for a plain stack of layers when each layer has exactly one input tensor and one output tensor. There must be said that the input tensor might have different dimension than the output tensor, but there must be still one output tensor.

- one input (1-->) and one output(-->1) per layer.

```python
## import libraries
import tensorflow as tf
import keras
from keras import layers
```

## sequential constructor

1. **First approach**.

This sequential constructor shows up an important feature in deep learning models: hierarchial feature learning (HFL).

HFL based on the idea that the model must learn from the basics to complex meaning that the model increases its abstraction and complexity level as the data progresses through the layers.

- 1st layer --> 2 units (2 dimensions of the layer outcome)
- 2nd layer --> 3 units (3 dimensions of the layer outcome)
- 3rd layer --> 4 units (4 dimensions of the layer outcome)

Deep learning excels at hierarchical feature learning because of its layered structure. Each layer acts as a step in the hierarchy, progressively building more intricate representations from the raw data. This allows the model to capture complex relationships within the data that might be missed by simpler models.

```python
model = keras.Sequential(
    [
        layers.Dense(2, activation='relu'), # the activation layer might change depending on the model conditions
        layers.Dense(3, activation='relu'),
        layers.Dense(4)
    ]
)
```

2. **Equivalent approach**.

It works like a function composition (it is in the core a function composition, thousand of function compositions). For replication purposes, a seed must be set: `tf.keras.utils.set_random_seed(96)`.

```python
#create 3 layers
layer1 = layers.Dense(2, activation='relu', name='layer1')
layer2 = layers.Dense(3, activation='relu', name='layer2')
layer3 = layers.Dense(4, activation='relu', name='layer3')
#call layers
x = tf.ones((3,3))
y = layer3(layer2(layer1(x)))


#check the sequential model structure
model.layers
```

Sequential constructor accepts a `name` argument, just like any layer or model in Keras. This is useful to annotate TensorBoard graphs with semantically meaningful names (let's use the first construction approach).

```python
model = keras.Sequential(
    [
        layers.Dense(2, activation='relu', name='layer1'), # the activation layer might change depending on the model conditions
        layers.Dense(3, activation='relu', name='layer2'),
        layers.Dense(4, name='layer3')
    ]
)
```

### Model weights and summary

After entering inputs to the model[^1], we can check the model weights and summary.

```python
model = keras.Sequential(
    [
        layers.Dense(2, activation="relu"),
        layers.Dense(3, activation="relu"),
        layers.Dense(4),
    ]
)

# Call the model on a test input
x = tf.ones((1, 4))
y = model(x)
print("Number of weights after calling the model:", len(model.weights))
```

Additionally, we can check the model (layers) structure by calling,

```python
model.summary()
```

[^1]: There is no way to check weights and summary for a sequential model without tensors to evaluate. Check 05_input_shapes_inadvance.md file.

### Incremental display

As previously seen, the model structure can be check after creating the model. Nevertheless, it might be a good practice to display the structure layer by layer before testing the model with a input (tensor).

This is done with the `keras.Input()` method within the Sequential model before any layer or passing an `input_shape` argument in the first layer.

1. `keras.Input()`

    The `keras.Input(shape=(Number,))` statement creates an input tensor with a shape of (None, 4) where `None` dimension represents the batch size set to `None` indicating that the model can accept inputs with any batch size.

    ```python
    model = keras.Sequential()
    model.add(keras.Input(shape=(4,)))
    model.add(layers.Dense(2, activation="relu"))

    model.summary()
    ```

    But, the `keras.Input()` object is not display in the model structure i.e. it is not part of the model since it is not a layer:

    ```python
    model.layers
    ```

2. `input_shape`

    ```python
    model = keras.Sequential()
    model.add(layers.Dense(2, activation="relu", input_shape=(4,)))

    model.summary()
    ```

    Before starting the debugging workflow let's make an introduction regarding to the `Convolution`not only in Machine Learning but in general Maths. For doing so, just jump out to the Convolution section.



### Do not use a Sequential model when:

- Multiple inputs and outputs
- Layer sharing
- Non-linear topology (residual connection, multi-branch model)
