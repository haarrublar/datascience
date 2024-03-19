## the tensor is initialized
tensor = tf.constant(['array'])

## tensor shape and type as usual in numpy
tensor.shape
tensor.dtype

## arrays or even list can turn into tensors
tensor = tf.convert_to_tensor([1,2,3])