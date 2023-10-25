
<div style="color: #f53;border: 1px solid #f53;padding: .5em .7em;border-radius: .25em;">TODO: rewrite this page</div>

## Server Side HTML Rendering

Karax can also be used to render HTML on the server.  Only a subset of
modules can be used since there is no JS interpreter.

```nim

import karax / [karaxdsl, vdom]

const places = @["boston", "cleveland", "los angeles", "new orleans"]

proc render*(): string =
  let vnode = buildHtml(tdiv(class = "mt-3")):
    h1: text "My Web Page"
    p: text "Hello world"
    ul:
      for place in places:
        li: text place
    dl:
      dt: text "Can I use Karax for client side single page apps?"
      dd: text "Yes"

      dt: text "Can I use Karax for server side HTML rendering?"
      dd: text "Yes"
  result = $vnode

echo render()
```

You can embed raw html using the `verbatim` proc:

``` nim
let vg = """
<svg height="100" width="100">
<circle cx="50" cy="50" r="40" stroke="black" stroke-width="3" fill="red" />
Sorry, your browser does not support inline SVG.
</svg>
"""
let wrap = buildHtml(tdiv(class="wrapper")):
    verbatim(vg)

echo wrap
```

