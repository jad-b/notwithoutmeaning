
# Thesis
Execute and record internet traffic scenarios.

# Summary
An ideal test of traffic control combines both black-box testing and white-box
monitoring. This requires being both in control of the traffic sources and
sinks. Traffic sources can be orchestrated to execute Scenarios, instructions
answering the questions "what kind, how much, how often, and where" where
sending traffic, recording whether the traffic succeeded, failed, or is pending.
Sinks listen for and record Scenario traffic. Analysis of the Scenario's outcome
is available for later analysis.

# Explanation
* The Problem
* The Solution
* Components
  * Scenario
  * Source
  * Sink
  * Orchestrator
* Leveraging existing monitoring
* Post-Scenario Analysis
* Outstanding Questions

DDoS is a crippling yet easily-obtained capability that threatens any internet
presence. Recent examples include the Playstation Network, the journalist
Brian Krebs, and Dyn, a DNS provider. Importantly, the recent attack on Dyn showed how
single points of failure, such as DNS, can result in multi-company impact for a
single attack. With companies for whom their online accessibility if critical to
their services, correctly handling identified malicious traffic is key to their
continued existence. This assumption, when coupled with the mantra "that which
is untested is broken", implies that without realistic yet safe means of
simulating malicious traffic, all preparations aren't proven effective until the
next attack. Can we do better?

Simluating DDoS attacks requires a few

Clients record route traffic into Client x Route tables. The cell of each table
holds the State of the traffic: Pending, Success, or Failed. Metadata concerning
the actual sending of the traffic is indexed by a FK of (Client, Route).

Similar to Clients, Hosts store the State of route traffic in a Host x Route
table. Given an arbitrary number of intermediate steps between a client and its
destination, which a `traceroute` to a any given public service can display,
hosts may not be able to easily identify whether or not they _should_ receive a
given Route's traffic. Some introspection may be possible for things like HTTP,
where the Host: header can be examined, but other protocols may not offer such
clues. Thus, (Host,Route) State must _assume_ that they're not meant to receive
traffic and begin in the Success state, changing to Failure upon receipt of
traffic.






# Excrutiating Detail
