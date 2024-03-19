## datasets name
import tensorflow_datasets as tfds

## load all available builders (datasets)
tfds.list_builders()

## observe one data in the datasets (structure)
ds = tfds.load('whatever dataset')
ds.take(1)