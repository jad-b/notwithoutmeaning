+++
categories = []
date = "2016-07-28T10:26:22-04:00"
tags = []
title = "Multi-[_blank_] Modeling"

+++
> Multilevel models are statistical models of parameters that vary at more than one level. - source: [Multilevel model:wikipedia].

This implies that the same parameters can take different values amongst sibling models of different parents. To
illustrate, let's work through the [example given in wikipedia](https://en.wikipedia.org/wiki/Multilevel_model#Example):

A basic linear regression model for predicting income may take age, class, gender, and race as parameters:
`$f(age,class,gender,race) = income$`. However, this is likely to predict the same income for a 45-year old black man in
Seattle, WA as it would for one in Mobile, AL. A simple way to attempt account for this would be to determine the _bias_
for each location, and add or subtract that from the estimated income. However, it's obvious this is pretty naive; it
attempts to account for _all_ the differences between locations by a fixed value.

A multilevel model allows our parameters of age, class, gender, and race, to take different values per location, by
adding location as a level to our model. Now, our income estimators are scoped by location.

It's still assumed that _all_ values for each parameters are drawn from a shared underlying distribution. To explain,
consider all the values we'd likely learn to explain the impact of age, a.k.a the coefficient for the age parameter,
a.k.a `$\theta_{age}Age$`. Let's pretend that the bigger the location, the more age benefits you; population will be
proportional to the value with which we weight age, `$\theta_{age}Age$`. As there are more people in urban areas,
the distribution of age coefficients will be weighted towards the higher end to reflect that
_in general_, people make more as they get older.

I'll posit that people make more as they get older. We could even pretend it's a linear relationship, as simple as
`$income = poverty_line + \theta_{age}Age$`. Now, what if we observe that people in cities make _even more_ as they get
older than people who aren't? And, it turns out, that a majority of older (50+) people live in cities? Well, that means
the values we're calculating to weight the impact of age, a.k.a the age coefficients, a.k.a `$\theta_{age}$`,
will reward age more heavily than if the majority of older people _weren't_ in cities. So the distribution of _all_
the age coefficients, `$\theta_{age}$` we'll learn per location will favor age, up to a point.


Multilevel models are subclasses of Hierarchical Bayesian Models.

Select between models using Bayesian|Akakike Information Criteria (the equivalent of `score()` in sklearn.)


[Multilabel algorithms:sklearn]: http://scikit-learn.org/stable/modules/multiclass.html
[Multilevel model:wikpedia]: https://en.wikipedia.org/wiki/Multilevel_model
