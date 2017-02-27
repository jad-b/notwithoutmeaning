+++
categories = ["programming"]
date = "2016-05-23T13:49:56-04:00"
tags = ["nosql", "consul", "key-value"]
title = "Schema in a Key-Value Store"
draft = "true"
+++

I need to enforce a schema on top of Consul's K/V store. It's not SQL, so I
can't use any tools for generating SQL commmands from a schema, or an ORM.

Some _real_ quick colloquial definitions:

Entity
: The thing stored in your NoSQL database.

Resource
: The thing you're operating upon and referencing in your RESTful API call; `POST
http://api.example.com/resources/item17` creates item17 under the `resources` collection.


Resources/Entities need to be versioned. This is to match my employer's move to indicating
the version of a REST API's resource in its Content-Type;
`application/vnd.<company>.<resource>.v#+json`, where `<company>` and `<resource>` are
placeholders, and `v#` would be the actual version.

## [Baseline the schema]
Since a K/V store intentionally doesn't enforce structure, we'll have to outside of
Consul. Personally, I'd like to give an Interface description language [IDL]) a go. Here's
what it'd look like as a Google Protocol Buffer:

```protobuf
// A Route for directing traffic
message Route {
    required string host = 1;    // The hostname is the top-level switching value
    required string path = 2;    // A hosthame + path form a unique route ID
    repeated string targets = 3; // List of URLs to proxy traffic to
    required string group = 4;   // The owning group
    required string label = 5;   // Name of the collection this route belongs to
    required uint32 version = 6; // Version of the entity
}

// Associates a collection of routes with a Group and label
// /groups/{group}/{label}
message RouteGroup {
    required string group = 1;  // Name of the owning group
    required string label = 2;  // Name of the collection
    repeated string routes = 3; // Keys of member routes; /routes/{group}/{label}/
}

// A metadata table for tracking the current schemas
// /gateway/schema
message GatewaySchema {
    required SemVer routeSchema = 1; // Maj.Min.Patch
    required SemVer groupSchema = 2; // Maj.Min.Patch
    optional bool updateInProgress = 3; // Whether or not a schema upgrade is occurring.
    required Timestamp lastModified = 4; // Timestamp of last update
{

// Semantic Versioning
message SemVer {
    required uint32 major = 1;
    required uint32 minor = 2;
    required uint32 patch = 3;
}
```

I'm having trouble with being able to normalize the data. `group` appears in
the Route, the RouteGroup, and the key of the RouteGroup; there's data
redundancy all over the place! After reading a solid answer on SO about
[Relationships in NoSQL], it appears this redundancy, and the associated risk
of it getting out of sync (called an "anomaly"), is the fall-out from leaving
relationships behind.

## Upgrading
To the heart of the issue.

[__One approach__](http://nothing.tmtm.com/2009/02/gradual-deployment-of-schema-changes/):
Make the client backwards-compatible, allowing for the schema to be slowly
upgraded, then drop the backwards-compatibility.

1. Add column/table
2. Change code to write to both old and new entity; deploy to all clients
3. Sync missing entries from old => new
4. Change code to read from new entity; deploy to all clients
5. Drop old entity

Similar sentiment echoed [here](http://nothing.tmtm.com/2009/02/gradual-deployment-of-schema-changes/),
and in the "Managing Data" chapter of [Continuous Delivery](http://www.amazon.com/dp/0321601912?tag=contindelive-20).
However, that advice is geared towards relational databases, where a schema
mismatch results in errors from the DB. Not so with a K/V store; the key either
exists or it doesn't, and you get _something_ back.

If we can answer these questions:

* How do clients know which version of an Entity they're using?
* How can we automate the final upgrade?

...I think we can pro/con the possibilities and bring this to a close.

What I _really_ see is this dichotomy:

1. Holistic data migration; Lock the K/V store and upgrade each entity
    * Clients can be A) written to operate on both old and new schemas, or
      B) deployed for a specific version, and written to activate/deactivate based
      on type.
    * How do you handle incoming requests inside an upgrade, a.k.a Zero
      Downtime?
        * If using Client A, then you can queue the request and try again
          later.
        * If Client B, and it's set to the old schema, that request would have
          to be re-sent, or more likely, just dropped on the floor.
2. "Continuous" migration; each entity is in a different state, and client code
   upgrades as it goes.
   * Clients need to be written to support _all_ active versions an Entity can
     be retrieved in. Now, this needs to be done anyway for HTTP Resources, as
     an HTTP client could give the server any of the currently supported
     versions.
    * Zero downtime is handled by the client.
    * How do you avoid versions drift across your Entities?
        * Run a batch job that upgrades remaining old schemas, once all clients
          are on the new version.
        * If the clients register themselves in Consul, they can attach tags
          indicating the highest version they support for each entity. Once all
          clients have a tag "EntityType=vNew", perform the upgrade.



[Relationships in NoSQL]: http://stackoverflow.com/a/4210561
[Three Rules for Database Work]:
    http://odetocode.com/blogs/scott/archive/2008/01/30/three-rules-for-database-work.aspx
[Baseline the schema]:
    http://odetocode.com/blogs/scott/archive/2008/01/31/versioning-databases-the-baseline.aspx
[IDL]: https://en.wikipedia.org/wiki/Interface_description_language
