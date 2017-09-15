+++
title: "Dataflow"
date: 2017-08-30T13:47:31-04:00
categories = ["code"]
tags = ["programming", "architecture"]
draft = true
+++
"Nodes" are used synonymously for instruction sets.

Dataflow processors have two kinds of units: enabling & functional units.
Functional units execute instructions on data to produce outputs (more data),
addressed with their destination. Enabling units handle data accumulation,
assignment of data to nodes, and moving the (data, instruction) tuple to a
functional unit.

## Resources
* Dennis, J. B. "Dataflow Supercomputers." Computer 13:4, November 1980, pp. 48–56.
* Hazra, A. "A Description Method and a Classification Scheme for Dataflow
  Architectures." Proceedings of the 3rd International Conference on Distributed
  Computing Systems, October 1982, pp. 645–651.
* Silc, J., Robic, B., & Ungerer, T. Processor Architecture: From Dataflow to
  Superscalar and Beyond. New York: Springer-Verlag, 1999.
* Srini, V. P. "An Architectural Comparison of Dataflow Systems." IEEE Computer,
  March 1986, pp. 68–88.
* Treleaven, P. C., Brownbridge, D. R., & Hopkins, R. P. "Data-Driven and
  Demand-Driven Computer Architecture." Computing Surveys 14:1, March 1982, pp.
  93–143.
* Vegdahl, S. R. "A Survey of Proposed Architectures for the Execution of
  Functional Languages." IEEE Transactions on Computers C-33:12, December 1984,
  pp. 1050–1071.
