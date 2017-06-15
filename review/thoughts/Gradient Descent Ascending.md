+++
categories = ["machine learning"]
date = "2016-05-13T07:20:33-04:00"
tags = ["mlsl", "machine learning", "math"]
title = "Gradient Descent: Ascending"

+++

> Gradient descent keeps ascending my cost.

_Funny story_, the issue wasn't with the gradient descent implementation at all, but rather
the cost function(least squares). I was calculating my error by subtracting my
predicted values from the actual values(y), `$error = predicted - y$`, instead of the other
way around, `$ error = y - predicted$`.

<!--more-->

This washed out when it came to calculating cost, since you end up squaring the error:

<div>$$
    J(\theta) = \frac{1}{2m}\sum_{i=1}^m(h_{\theta}(x^{i}) - y^{i})^{2}
$$</div>

but it _doesn't_ get squared when you calculate the gradient:

<div>$$
    \theta_{j} := \alpha\frac{1}{m}\sum_{i=1}^m (h_{\theta}(x^{(i)})-y^{(i)})x_{j}^{(i)}
$$</div>
