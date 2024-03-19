## Check the number of available units for GPU
import tensorflow as tf
import os
os.environ["CUDA_VISIBLE_DEVICES"] = "0"

print("Num GPUs Available: ", len(tf.config.list_physical_devices('GPU')))

## get the GPU description
from tensorflow.python.client import device_lib
print(device_lib.list_local_devices())