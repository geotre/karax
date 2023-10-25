
<div style="color: #f53;border: 1px solid #f53;padding: .5em .7em;border-radius: .25em;">TODO: rewrite this page</div>

## Event model

Karax does not change the DOM's event model much, here is a program
that writes "Hello simulated universe" on a button click:

```nim

include karax / prelude
# alternatively: import karax / [kbase, vdom, kdom, vstyles, karax, karaxdsl, jdict, jstrutils, jjson]

var lines: seq[kstring] = @[]

proc createDom(): VNode =
  result = buildHtml(tdiv):
    button:
      text "Say hello!"
      proc onclick(ev: Event; n: VNode) =
        lines.add "Hello simulated universe"
    for x in lines:
      tdiv:
        text x

setRenderer createDom
```

``kstring`` is Karax's alias for ``cstring`` (which stands for "compatible
string"; for the JS target that is an immutable JavaScript string) which
is preferred for efficiency on the JS target. However, on the native targets
``kstring`` is mapped  to ``string`` for efficiency. The DSL for HTML
construction is also available for the native targets (!) and the ``kstring``
abstraction helps to deal with these conflicting requirements.

Karax's DSL is quite flexible when it comes to event handlers, so the
following syntax is also supported:

```nim

include karax / prelude
from sugar import `=>`

var lines: seq[kstring] = @[]

proc createDom(): VNode =
  result = buildHtml(tdiv):
    button(onclick = () => lines.add "Hello simulated universe"):
      text "Say hello!"
    for x in lines:
      tdiv:
        text x

setRenderer createDom
```

The ``buildHtml`` macro produces this code for us:

```nim

let tmp2 = tree(VNodeKind.tdiv)
let tmp3 = tree(VNodeKind.button)
addEventHandler(tmp3, EventKind.onclick,
                () => lines.add "Hello simulated universe", kxi)
add(tmp3, text "Say hello!")
add(tmp2, tmp3)
for x in lines:
  let tmp4 = tree(VNodeKind.tdiv)
  add(tmp4, text x)
  add(tmp2, tmp4)
tmp2
```
As the examples grow larger it becomes more and more visible of what
a DSL that composes with the builtin Nim control flow constructs buys us.
Once you have tasted this power there is no going back and languages
without AST based macro system simply don't cut it anymore.
