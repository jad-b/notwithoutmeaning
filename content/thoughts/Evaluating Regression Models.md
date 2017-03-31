+++
categories = ["programming"]
date = "2016-05-25T06:30:42-04:00"
tags = ["machine learning", "regression"]
title = "Evaluating Regression Models"
draft = "true"
+++

Working on implementing Linear Regression in [MlSL] has taught me a few things:

* First solve your problem using the existing tool; in my case, that's
  scikit-learn
* Build to the scikit-learn interface until you know what you're doing; it's
  become the _lingua franca_ of machine learning APIs.
* Stupid mistakes will abound; be ready to debug.

I've written a small post of debugging why my [Gradient Descent kept
ascending]({{< ref "post/Gradient Descent Ascending.md" >}}), which came down
to the order of subtraction in my cost function. Throwing `assert X.shape ==
(n, k)` around has also helped avoid matrix multiplication stumpers.

My implementation(s) get closer and closer to performing well, but small things
still abound. Recently, I looked closer at a test that was producing 0%
accuracy and realized I'd inserted the wrong evaluation criteria:  I was doing
an absolute comparison between my targets and my predictions.

Since regression predicts real-valued numbers, like floating points, you're
nearly guaranteed to _not_ have your predictions match up exactly, as long as
both values have enough precision. Instead, you're going to have to compare
approximately using functions like `numpy.isclose`.

[MlSL]: https://github.com/jad-b/mlsl
[sklearn's regression metrics]:
    http://scikit-learn.org/stable/modules/model_evaluation.html#regression-metrics
[Dato article on regression metrics]:
    http://blog.dato.com/how-to-evaluate-machine-learning-models-part-2b-ranking-and-regression-metrics
[AWS on regression model insights]:
    http://docs.aws.amazon.com/machine-learning/latest/dg/regression-model-insights.html
