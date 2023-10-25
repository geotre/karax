
<div style="color: #f53;border: 1px solid #f53;padding: .5em .7em;border-radius: .25em;">TODO: rewrite this page</div>

TODO: rewrite this to make sense as a standalone guide.

## Debugging


### Guide

Via ``-d:debugKaraxDsl`` we can have a look at the produced Nim code by
``buildHtml``:

```nim
let tmp1 = tree(VNodeKind.tdiv)
add(tmp1, text "Hello World!")
tmp1
```
(IDs shortened for better readability.)

Ok, so ``buildHtml`` introduces temporaries and calls ``add`` for the tree
construction so that it composes with all of Nim's control flow constructs:


```nim

include karax / prelude
import random

proc createDom(): VNode =
  result = buildHtml(tdiv):
    if rand(100) <= 50:
      text "Hello World!"
    else:
      text "Hello Universe"

randomize()
setRenderer createDom

```
Produces:

```nim

let tmp1 = tree(VNodeKind.tdiv)
if rand(100) <= 50:
  add(tmp1, text "Hello World!")
else:
  add(tmp1, text "Hello Universe")
tmp1
```


### Compiler flags

Karax will accept various compile time flags to add additional checks and debug info.

e.g. `nim js -d:debugKaraxDsl myapp.nim`

| flag name       | description |
| --------------- | ----------- |
| debugKaraxDsl   | prints the Nim code produced by the `buildHtml` macro to the terminal at compile time |
| debugKaraxSame  | Ensures that the rendered html dom matches the expected output from the vdom. Note that some browser extensions will modify the page and cause false positives |
| karaxDebug*     | prints debug info when checking the dom output and applying component state |
| stats*          | track statistics about recursion depth when rendering |
| profileKarax*   | track statistics about why nodes differ |

_* = used when debugging karax itself, not karax apps_
