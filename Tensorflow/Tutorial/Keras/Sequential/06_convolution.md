# Convolutions

Thinking about convolutions relate us to pair-wise matrix multiplication (algebra) or classical integral transformations given by

$$
(kF)(x) = \int_{\Omega} k(x,t)f(t)dt 
$$

where $k$ is the kernel function. Those kernels functions by historical definition alter, modifies or defines the function behavior over the $\Omega$ space.

So, **is the convolution and integral or a multiplication?**

In essence, we might define a convolution a a transformation in between two functions which might be discrete or continuous, and depending on that the definition varies.


| Discrete               |            Continuos |
| :---------------------:| :--------------------: |
| $ \displaystyle [f*g](x) = \sum_{m=-\infty}^{\infty} f(m)g(t-m) $            | $ \displaystyle [f*g](x) = \int_{-\infty}^{\infty} f(x)k(t-x)dt  $                 |


This definitions have some hypothesis over the functions and functions domain that I decided to omit. In case, there is interest regarding a wider view and perspective about convolutions I recommend following this resources:

- 
- 
- 


It is clear (I hope) that the previous definition is also applicable to vectors and matrices. 


It is not crucial in this post to present a deeper and rigorous blog regarding convolutions but, I can introduce some examples to clarify even more the definition. Let's dive in a little bit in this concept (shout-out to [3Blue1Brown](https://www.youtube.com/@3blue1brown)):

## Example

_Consider having a pair of dice, not biased. What is the probability that the sum of trowing the dice is equals to 6?_

### Approach

As mathematicians or with some knowledge of statistics we might think about the multiplication of probabilities, and we might found the way to solve the problem. Considering we are talking about a Laplacian probability space (finite and same probability for all random variables in the sample space), then we might just consider the following table:


| +      | **1** | **2** | **3** | **4** | **5** | **6** |
|:-------:|:-------:|:-------:|:-------:|:-------:|:-------:|:-------:|
| **1**  | 2     | 3     | 4     | 5     | 6     | 7     |
| **2** | 3     | 4     | 5     | 6     | 7     | 8     |
| **3** | 4     | 5     | 6     | 7     | 8     | 9     |
| **4**  | 5     | 6     | 7     | 8     | 9     | 10    |
| **5**  | 6     | 7     | 8     | 9     | 10    | 11    |
| **6**  | 7     | 8     | 9     | 10    | 11    |  12     |


The previous table represents the sample space of all possible outcomes when rolling a pair of unbiased dice. To calculate the probability of the event "the sum of the two dice equals 6," we count the number of favorable outcomes (pairs that sum to 6) and divide it by the total number of outcomes in the sample space.

**NOTE**: The same approach might be made for biased events, and in general the solution is given by:

$$
P_{X+Y} (3) = P_{X}(1)P_{Y}(2) + P_{X}(2)P_{X}(1)
$$

or even more general

$$
P_{X+Y} = [P_{X+Y}](s) = \sum_{n=1}^{6}  P_{X}(n)P_{Y}(s-n)
$$

This setup can be made because of the wide relation in between convolution and the sum of two random variables.


## Convolutional Neural Networks

We are focusing on Tensorflow, particularly on how convolutional neural networks (CNNs) are used in various models. 

CNNs are primarily employed for image classification, where an image is transformed into its vector representation, typically using RGB (color) or grayscale values. These networks are often applied to images of sizes such as 28x28 pixels in well-known cases such as MNIST database.

It is not mandatory to set the image size (pixels) into those units, but it is important to notice that depending on the vector (image) dimension (size and color type), the model complexity increases.


|   Image    |   Size    | Color |  Channels | Vector Dimension |
| :----------: | :----------: | :----------: | :----------: | :----------: |
| one          | 28 x 28      |     RGB      |      3       | (1,28,28,3)
| two          | 28 x 28      |     Grayscale (B/W)     |      1       | (1,28,28,1) |


Here, pixel values typically range from 0 to 255 in grayscale images, where 0 is black and 255 is white. That is also true for RGB images, where each color channel (Red, Green, Blue) also ranges from 0 to 255, but this ranges represents thousands of thousands of colors.

Nevertheless, it is important to mention that we do not take all values in the matrices but the normalized values for speeding up the process i.e. reducing the model complexity. One simple and effective normalization strategy might be `Min-Max` normalization follows by:

$$
\dfrac{value - min}{max - min}
$$

in this case (spoiler) is dividing by 255.

### How the convolution works in/out Tensorflow

Let's dive in convolution operation properly. Consider the following example where we compare by hand and TensorFlow operation.

First, we set the variable for the entire example including a seed for replication purposes (you can double-check at home).

```python
import tensorflow as tf
import numpy as np

# seed
np.random.seed(96)

# input tensor and kernel
x = np.random.rand(4,4)
kernel = np.array([[1,-1],[-1,1]])
black - white
```

#### Out Tensorflow (by hand)

Create a simple example for an image size 4x4 pixels with just one channel (corresponding to grayscale - black/white color) without strides option (we'll see that in a moment).

```python
n = kernel.shape[0]
m = x.shape[0]

storage = []
for i in range(m-n+1):
    for j in range(m-n+1):
        element = np.array([x[i][0+j:n+j],x[i+1][0+j:n+j]])
        sum_element = np.sum(np.multiply(element,kernel))
        storage.append(sum_element)


result = np.reshape(np.array(storage),(3,3))
```

#### Tensorflow

We use the tensorflow module `tensorflow.nn.conv2d`. The typical shape of an image tensor in TensorFlow is [batch_size, height, width, channels], where:

- batch_size: number of images in a batch.
- height: height of each image in pixels.
- width: width of each image in pixels.
- channels: number of color channels in each image (e.g., 3 for RGB images).

while the usual kernel shape in TensorFlow [filter_height, filter_width, input_channels, output_channels], where:

- filter_height: The height of the kernel.
- filter_width: The width of the kernel.
- input_channels: The number of input channels the kernel operates on.
- output_channels: The number of output channels produced by the kernel.  


So in this case, before entering the data manually (in the general models tensorflow does this transformations for us) we must do some transformations:

```python
# tensor/kernel reshape for grayscale one image

x_tf = tf.constant(x, dtype=tf.float32)
x_tf = tf.reshape(x_tf, [1, x_tf.shape[0],x_tf.shape[1],1])

kernel_tf = tf.constant(kernel, dtype=tf.float32)
kernel_tf = tf.reshape(kernel_tf, [2, 2, 1, 1])

# tf.nn.conv2d(x_tf,kernel_tf,strides=[1,1,1,1],padding='VALID') equivalent expression
tf.nn.conv2d(x_tf,kernel_tf,strides=(1,1),padding='VALID')
```

#### Comparing results

Well, it is not surprise, it's maths. The feature maps (resultant tensor after convolution) match:


<table style="margin: auto; border: 1px solid black;">
<tr>
    <td colspan="3" style="text-align: center;"> By Hand</td>
</tr>
<tr>
    <td>-1.28361855</td>
    <td>0.06659161</td>
    <td>0.38292808</td>
</tr>
<tr>
    <td>0.05634807</td>
    <td>0.31326589</td>
    <td>-0.50530246</td>
</tr>
<tr>
    <td>0.32573864</td>
    <td>-0.28769333</td>
    <td>-0.12484254</td>
</tr>
</table>

<table style="margin: auto; border: 1px solid black;">
<tr>
    <td colspan="3" style="text-align: center;"> Tensorflow </td>
</tr>
<tr>
    <td>-1.28361855</td>
    <td>0.06659161</td>
    <td>0.38292808</td>
</tr>
<tr>
    <td>0.05634807</td>
    <td>0.31326589</td>
    <td>-0.50530246</td>
</tr>
<tr>
    <td>0.32573864</td>
    <td>-0.28769333</td>
    <td>-0.12484254</td>
</tr>
</table>



## Strides and Padding

Here, we set some important definitions for convoluting two tensors in general. Going back to the TensorFlow code implementation, we have the following:

```python
...
...

tf.nn.conv2d(x_tf,kernel_tf,strides=(1,1),padding='VALID')
```

What does $strides=(1,1)$ means? It actually refers to the step the convolution is doing: one row and one column at the time starting from the first column first row.


Then, a tensor 4x4x1 enter and after the convolution a 3x3x1 feature map exits. In case, there must be same size of output (which is normal when running a CNN model) the padding option might be used, adding the necessary number of zero rows above, below, left and right to the 4x4x1 entering tensor such that the feature map has the same size as the entered tensor.

**NOTE**: Even thought the _strides_ option is modified, if the _padding='same'_, the algorithm will add around the entered tensor as much zero rows and columns as possible to make the feature map same size as the entered tensor.

In TensorFlow, the option to get that result is the following:

```python
...
...

tf.nn.conv2d(x_tf,kernel_tf,strides=(1,1),padding='same')
```