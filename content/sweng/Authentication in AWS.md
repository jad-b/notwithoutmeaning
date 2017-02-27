+++
date = "2015-10-09"
title = "Authentication in AWS"
tags = ["REST", "API"]
category = ["programming"]
draft = true
+++

When requesting an operation against a system, you must *authenticate* - prove
who you are - as well as *authorize* - be proven you are allowed to perform the
action.

In RESTful systems, all operations occur upon resources - the nouns of your
system. Examples include user accounts, bills, Docker containers, tweets, and
blog posts.

To authenticate, the client must provide credentials by which the server can
deem valid.  Authorization is up to the server; what will I, the server, allow
a user to do?  Anyone can enter a bank; the security guard will let you know if
your behvaior is acceptable.

Providing a username & password is a means of accomplishing both authentication
and authorization. Authentication: Does a user with this username/password
exist? Yes? The user is authenticated.

Only the username is required to authorize a user: This user wants to do _x_;
are they allowed to do that? Yes? Then they are authorized.

Requests to AWS use the same notion of username/password, but they do so with
randomly generated strings. Your username is their AWS Access Key; your
password their AWS Secret Key.

AWS also verifies the integrity of the received request - is the request I, the
server, received the same request sent by the client? This lets the server know
tampering hasn't occurred. It is much like placing a wax seal on a letter; if
the wax has been broken, then the message may have been modified. However, the
AWS signature added to a request doesn't tell us if anyone else has already
_read_ our message; that requires hiding the message contents (encryption).

AWS has a protocol for generating the signatures that standardises the
signature formula inputs. This is essential, as two parties, remote from one
another, _must_ arrive at the same value. Otherwise you'd always arrive at the
conclusion that tampering has occurred, due to your mis-matching signatures.

The actual AWS signature algorithm reads as such:
1. Assemble signing content
    1. HTTP Method
    1. Content-Type Header
    1. Content-MD5 Header
    1. Date (from Date or x-aws-date header)
    1. Any Amazon headers
        1. String standardization: lowercasing, lexicographically-sorting,
           whitespace-trimming, csv-joining of duplicate headers.
    1. Resource Path
1. UTF-8 Encode signing content
1. HMAC-SHA1 signging conent with the AWS Secret Key
1. Base64 encode the result

There are additional, important, details you'd _have_ to implement in order to
arrive at correct signatures, but that's better documented by AWS
themselves.
