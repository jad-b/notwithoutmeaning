+++
categories = ["programming"]
date = "2016-05-12T15:03:45-04:00"
tags = ["testing", "state machine", "python"]
title = "System Testing with State Machines"
draft = "true"
+++

A work project needs to be proved reliable. It consists of three distinct
services, each of which has multiple instances running, and two of which are
required to hold state. An update through the first service, which provides the
HTTP API, causes a corresponding update in the data store. The data store
triggers a handler to update all known instances of the third service.

I'd like to assert how the system behaves under varous scenarious: No instances
up, some instances up, everything up, node down, node joins, etc. For whatever
reason, "state machine" kept leaping to mind.
