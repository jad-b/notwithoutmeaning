+++
categories = ["software engineering primer"]
date = "2016-12-08T14:21:50-05:00"
tags = ["logging"]
title = "Logging"
+++

## Takeaways
* Resource-oriented APIs have a common set of CRUD operations to test for.
* The depedency graph for functionally testing data operations:

    Create-->Retrieve-->Search
             |
             +-->Update-->Patch
*

HTTP application standards have converged rapidly within the last few years,
thanks to interface formalization via the OpenAPI specification and the common
cross-organization emphasis on RESTful web APIs.
