+++
categories = ["code"]
tags = ["programming"]
date = 2017-07-13T07:20:24-04:00
title = "Ring Buffer"
+++
A __ring buffer__ is a circular _Queue_ of fixed size. When data would be written
past the end of the buffer, it instead wraps around to overwrite data at the
beginning. Allocating memory only once provides performance improvements, and
the fixed size provides constant memory usage.

### Key Points
* Decide between using a `size` variable or allocating an extra slot for
  differentiating between empty and full conditions.
* Decide whether to overwrite or throw an error if an overwrite would occur.
* The `read` pointer _never_ advances past the `write` pointer.
* If overwriting, the `read` pointer needs to be advanced as well.
* Careful when you increment `size` relative to testing for emptiness or
  fullness.

## Complexity
Time Complexity|Average |Worst
---------------|--------|-------
Deletion       |`$O(1)$`|`$O(n)$`
Enqueue        |`$O(1)$`|`$O(1)$`

## Behavior
* `enqueue(B, x)`: Write a value to the buffer in the next available slot.
  A decision must be made how to handle the case of writing to a full buffer.
  The implementation may either allow unread data to be overwritten, starting
  with the oldest data first, or it may signal an inability to write back to
  the user.
  * Let W and R be the location of the write and read pointers.
  * If R == W, the buffer is empty
    * Write to the slot, and advance the write pointer
    * If R == W after advancing,
      * Advance the read pointer, so reads start with the oldest data.

* `dequeue(B, x)`: Read the next available value.
  Similar but opposite to `enqueue` above, the method must signal an inability
  to read from an _empty_ queue.


## Layout
Obviously an array is required. For performance and simplicity's sake, the array
should be of the same type, although the items do not have to be, and this may
force the user to interact with the object in terms of their byte size.

```julia
mutable struct RingBuffer{T}
    # The buffer.
    buf::Array{T,1}
    # The next write location.
    wptr::UInt
    # The next read location.
    rptr::UInt
    # (Optional) The size of the buffer. Saves method calls to length(buf).
    size::Int
end
```

The buffer is empty when the read pointer is at the same location as the write
pointer. The buffer is _full_  when the read pointer is one slot ahead of the
write pointer; however, the read pointer may never advance _past_ the write
pointer, so this is only achieved when the write pointer advances through the
array once.

## Notes
Ping-pong buffering alternates reading and writing between two different
buffers, removing intra-buffer race conditions between reads and writes at the
cost of twice the memory.
