+++
categories = ["software engineering primer"]
date = "2016-12-08T14:21:50-05:00"
tags = ["logging"]
title = "Logging"
+++
## Takeaways
* Logs are event streams, first and foremost. Events must detail which
  component (Where), the action (What), and the initiator (Who). The "How" is to
  be determined by following events; presumably, we know the "Why".
* Assign semantics to the different log levels. Suggested
    * DEBUG: Events within subcomponents; variable tracing.
    * INFO: Top-level events during normal operation.
    * WARNING: Third-party errors; undesirable trends.
    * ERROR: Recoverable code errors.
    * FATAL: Non-recoverable errors.
* Log errors when catching them and when translating between error types, not upon creation.

## Resources
* [OWASP Logging Cheat Sheet](https://www.owasp.org/index.php/Logging_Cheat_Sheet)
