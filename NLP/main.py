import os, zipfile
os.environ['TF_CPP_MIN_LOG_LEVEL'] = '3' # avoid importing tensorflow messages
import tensorflow as tf



# ________________________________________________#
# SPACE FOR DEBUGGING





# extracting files
zip_path = 'archive.zip'
extract_dir = './datasets'

with zipfile.ZipFile(zip_path, 'r') as zip_file:
    zip_file.extractall(extract_dir)


# checking the datasets content
import pandas as pd

ds_path = './datasets/'

train_ds = pd.read_csv(ds_path+'twitter_training.csv', names=['code','user','label','review'])
print(train_ds.head(5))


# converting the data into tensordata
train_ds = tf.data.TextLineDataset(ds_path+'twitter_training.csv')
test_ds = tf.data.TextLineDataset(ds_path+'twitter_validation.csv')

train_ds.
