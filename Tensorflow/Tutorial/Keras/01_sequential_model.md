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

It works like a function composition (it is in the core a function composition, thousand of function compositions). For replication purposes, a seed must be set: _tf.keras.utils.set_random_seed(96)_.

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

Sequential constructor accepts a _name_ argument, just like any layer or model in Keras. This is useful to annotate TensorBoard graphs with semantically meaningful names (let's use the first construction approach).

```python
model = keras.Sequential(
    [
        layers.Dense(2, activation='relu', name='layer1'), # the activation layer might change depending on the model conditions
        layers.Dense(3, activation='relu', name='layer2'),
        layers.Dense(4, name='layer3')
    ]
)
```

### Do not use a Sequential model when:

- Multiple inputs and outputs
- Layer sharing
- Non-linear topology (residual connection, multi-branch model)
