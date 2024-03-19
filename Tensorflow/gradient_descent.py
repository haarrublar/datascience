
"""
Adaptive gradient descent function : p_{n+1} = p_{n} - nu * df(p_{n})
where p_{n} is the starting point, nu is the learning rate,
and df(p_{n}) is the gradient of the funtion at p_{n}.

There must be said that the gradient of a function gives the direction
of steepest increase. So, as we need to find the/a minimum, we take the 
negative to find the steepest decrease (decreases the function most quickly).
Later, we update the new point p_{n+1} as the previous minus an small/large
value (learning rate) in the oposite gradient direction p_{n} - nu * df(p_{n}).

The learning rate A.K.A. nu adapts the model to decrease faster.

For the implementation of this method the function f may be one variable.

The implementation of this method requires a function defined. The 
definition may be by defining the function derivative using def method or
calling it with lambda method.
"""

from typing import Callable


def gradient_descent(start : float, gradient: Callable, learning_rate : float, 
                    max_inter : int, tol : float = 0.01):
    
    x = start
    record = [start]
    
    for _ in range(max_inter):

        """
        When the image*learning_rate is close enough to zero we arrive to a minimum (diff=0).
        """
        diff = learning_rate * gradient(x)
        
        if abs(diff) < tol:
            break
        
        """
        Update of the new p_{n+1} from the previous p_{n} in the Input space. The equation 
        is as follows:
        p_{n+1} = p_{n} - nu * df(p_{n})
        
        where p_{n} is the previous point in the Input space, -df(p_{n}) is the direction 
        where the function f decreases and nu is an small/large value to reduce p_{n} for
        approaching into the minimum direction.
        """
        
        x -= diff
        record.append(x)
        
    return x , record
