
<div style="color: #f53;border: 1px solid #f53;padding: .5em .7em;border-radius: .25em;">TODO: rewrite this page</div>

## Reactivity

Karax's reactivity model is different to mainstream frameworks, who usually implement it by creating reactive state. Karax instead reacts to events.

This approach is simpler and easier to reason about, with the tradeoff being that events need to be wrapped to trigger a redraw. Karax does this for you with dom event handlers (`onclick`, `keyup`, etc) and ajax network calls (when using `karax/kajax`), but you will need to add it for things outside of that (websocket messages, document timing functions, etc).

`karax/kdom` includes a definition for `setInterval`, the browser api that repeatedly calls a given function. By default it is not reactive, so this is how we might add reactivity with a call to `redraw`:

```nim
include karax/prelude
import karax/kdom except setInterval

proc setInterval(cb: proc(), interval: int): Interval {.discardable.} =
  kdom.setInterval(proc =
    cb()
    if not kxi.surpressRedraws: redraw(kxi)
  , interval)

var v = 10

proc update =
  v += 10

setInterval(update, 200)

proc main: VNode =
  buildHtml(tdiv):
    text $v

setRenderer main
```
