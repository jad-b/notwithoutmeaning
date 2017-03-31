+++
categories = ["software engineering"]
date = "2016-12-20T17:21:48-05:00"
tags = ["python", "artifactory"]
title = "Lessons in Python"

+++

Python's versioning scheme is a bit at odds with what you might expect. Upload a
package with version `0.1.3-dev4`, and when you go to `pip install
mypkg==0.1.3-dev4`, it normalizes it to `0.1.3.dev4`.
