+++
date = "2015-09-06"
title = "Filtering Go Tests With Build Tags"
categories = ["progamming"]
tags = ["golang", "progamming"]
draft = true
+++

A file without a build tag is _always_ included in the build.

To allow for building (and testing) everything from one tag to all files, you'll need to set a common tag on all files, which should be OR'd with your filtering tags.

## Why?

Build tags are _subtractive_; as you add tags, they serve to _reduce_ which files
will be included in the build(by default).

## The Setup:

You have two test packages, `rest_api_test.go` and `db_test.go`.

You'd like to be able to run all your tests, just the REST API tests, and just
the database tests using Go tags.

Your command to run them looks something like:
`go test -v github.com/your-name/your-repo`

Build tags are _subtractive_; as you add tags, they serve to _reduce_ which files
will be included in the build(by default).

If you add a build tag to your `db_test.go` file:
```go
// +build db

// Mind that you have a newline between '// +build ...' and 'package ...'
package tests
```

and run your command with the `db` tag specified:
`go test -v -tags db github.com/your-name/your-repo`

You'll still see the `rest_api_test.go` tests show up. That file doesn't have a
build tag yet, so it gets included in the test build.

Add `// +build web` to the top of your `rest_api_test.go` file.
Now `go test -v -tags db github.com/your-name/your-repo` will _only_ run your
database tests.

Now run `go test -v github.com/your-name/your-repo`. No tests will run!
Since all test files have tags, nothing will get picked by a build tag
specifier of "nothing".

Now add `test`, separated by a space, to each of your `// +build db|rest` tags.
`go test -v -tags test github.com/your-name/your-repo` will run tests in both
files.
