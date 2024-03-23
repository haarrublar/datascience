## Setting a seed in Tensorflow (Keras based models)

TensorFlow uses Numpy for many of its operations, and Numpy itself relies on the random module for operating. For that reason, setting a seed on the Tensorflow level or/and Numpy level is not an option. It must be done in those three levels: Tensorflow, Numpy and random (python module).

```python
# setting the seed
import random
import numpy as np
import tensorflow as tf

random.seed(96)
np.random.seed(96)
tf.random.set_seed(96)

#equivalent
import tensorflow as tf
tf.keras.utils.set_random_seed(96)
```
