+++
categories = ["programming"]
date = "2016-07-28T09:59:13-04:00"
tags = ["programming"]
title = "Lessons Learned: Software"
+++

* __Use TLS from the beginning.__
  There aren't many reasons you shouldn't. Snakeoil gets you in the practice of
  managing the keys, but a self-signed or corporate wildcard cert that's scoped
  to your development domain are even better. I'm finally seeing a plethora of
  key management tools[^kmt] begin to propagate, so no excuses.

* __Write functional tests to run against any envinromnet.__
  This means they need to accept configuration options, and should only
  affect test data they're responsible for creating and deleting. Now your
  integration tests can smoke-test production.
  If you can scope which tests run, which I know Python's `nose` and `pytest`
  and Golang's `go test -tags=smoke` can do, you can limit your tests to fit
  your requirements of run time, data safety, and validation.

* __Incremental modifications over re-writes.__
   You have code running, and now you need to change it. It's conceptually
   easiest to pretend like that code doesn't exist, and write from scratch.
   But only in concept. Re-writes ignore the ecosystem that code runs within -
   the system's that depend on it, the operational considerations you've learned to
   account for, and the realities of the world you've had to code around.
   Re-writes have a place. But they're usually the harder choice, long-term.

    Here's some ideas I've already had to use:

  * Don't forget about search & replace. Rename old objects to
    "OldStructure", or "StructureV1" while the deprecation is underway.
    People seem to get nervous about this, but if you missed something, a
    static language won't compile, and a dynamically-typed language will have
    its tests fail. If both of those fail to catch the error, is it really a
    problem with the replacement, or with your safety nets?

  * REST API: Isolate the old and new logic into different functions. Deploy
    new changes to a "dark" endoint under a different path. Toggle between
    old & new using a query parameter, or swap them at runtime using a flag.

  * Database: Adding new columns is easy. Modifying existing requires
    staggered deploys between the DB and its clients (probably your
    downstream API(s)). Sorry.  At some point, you will be faced with the
    choice of doing a total re-write, followed by a nerve-wracking deploy,
    replete with cross-team coordination, or biting off that complexity in
    small changes and frequent deployments. Small changes let you deploy
    faster. Deploying faster => Your work affects people faster. Mattering in
    other people's lives => putting off existential meaningless for one more
    day. Search "zero-downtime DB migration" for plenty of resources. I'm
    partial to the outline in Chapter 12 of "Continuous Delivery" by Jez
    Humble, titled "Managing Data".

* __Write backwards from your user interfaces__.
    Writing a web app? Start with the UI. You're writing the REST API the UI calls?
    Start with the API description. [OpenAPI is a thing now], and I'm not going
    back. It's a CLI tool? Write the options w/ flags, for what you know you
    need.

    Only write for what someone needs right now. What someone wants but not needs
    should live in a design conversation elsewhere, such as a GitHub issue, a
    text document, or a JIRA ticket.

    I believe this to be a (correct) generalization of "API-first" design and/or
    contract-driven design.

    One possible argument: This delays potentially deal-breaking backend
    considerations that are far-removed from the end-user experience.

    I think two things are imporant to keep in mind. First, your problem has
    likely been solved before, many times over. This is the case for most
    full-stack work. Thus, the amount of "unknowns" lurking out there
    are few, and always getting smaller. Second, all this really means is you
    have a conversation with your clients (The web UI team) exactly when you were
    actually building the tool they wanted. If anyone has examples of a tool
    simply can't be made human-friendlier, I'd be interested to know.


[^kmt]: Such as these:
    [Amazon KMS](https://aws.amazon.com/kms/),
    [Hashicorp's Vault's PKI Backend](https://www.vaultproject.io/docs/secrets/pki/index.html),
    [Square's certstrap](https://github.com/square/certstrap)
[OpenAPI is a thing now]: https://github.com/OAI/OpenAPI-Specification
