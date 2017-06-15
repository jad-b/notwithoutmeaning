+++
date = "2016-05-05"
title = "Testing Timeouts In Go With Channel Selects"
categories = ["programming"]
tags = ["golang", "concurrency", "testing"]
+++

```go
import (
    "net"
    "testing"
    "time"
)

func TestAddrResolve(t *testing.T) {
    network, addr := "ip4", "127.0.0.125:44151"
    addrChan := make(chan error)

    // Attempt to resolve IP addr
    go func(ch chan error) {
        _, err := net.DialTimeout(network, addr, 1 * time.Second)
        addrChan <- err
    }(addrChan)

    // Now, see who returns a msg first
    select {
    case e := <-addrChan:
        if e == nil {
            t.Fatalf("%s://%s should fail to resolve", network, addr)
        } else if testing.Verbose() { // Success!
            t.Logf("Call to %s://%s timed out.\nError\n\t%s", network, addr, e)
        }
    case <-time.After(1 * time.Second):
        t.Fatal("Address resolution failed to timeout in one second.")
    }
}
```
<!--more-->
