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
    * ERROR: Recoverable code errors. MAY result in a bug ticket.
    * FATAL: Non-recoverable errors. SHOULD result in a page.
* Log errors when catching them and when translating between error types, not upon creation.

Log WARNINGs are much like compiler warnings - ideally, you have none. In a
perfect world, the total number of warnings is reguarly reviewed by your team,
and you steadily work to eliminate the ones by order of ROI. Adding a unique ID
to your log messages can help with grouping; a more advanced technique I'm
seeing rolled out in modern logging services like Logz.io are starting to apply
group types of messages using machine learning techniques.

Anything over WARNING indicates something needs to be fixed, sooner rather than
later. Since an ERROR implies something screwed up on the product's end, the 5xx
series of HTTP codes if we're a web app, then something needs to get fixed down
the road. FATAL takes the next logical step and suggests that if it killed our
whole process, we should get someone up and looking at code _now_. If that seems
overly harsh, answer me this: how often do you really think it's acceptable for
your server to just up and die? Moreover, how often do you really _expect_ it
to? I'll give you one potential out: _If_ your service-management layer, such as
a Mesos, Kubernetes, Supervisord, what-have-you, can be keep track of total
_running_ services by type, _then_ you can only page when your threshold of (% failed/# running) services is surpassed.

## Resources
* [OWASP Logging Cheat Sheet](https://www.owasp.org/index.php/Logging_Cheat_Sheet)
