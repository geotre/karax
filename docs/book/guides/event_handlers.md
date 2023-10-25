
<div style="color: #f53;border: 1px solid #f53;padding: .5em .7em;border-radius: .25em;">TODO: rewrite this page</div>

## Attaching data to an event handler


Since the type of an event handler is ``(ev: Event; n: VNode)`` or ``()`` any
additional data that should be passed to the event handler needs to be
done via Nim's closures. In general this means a pattern like this:

```nim

proc menuAction(menuEntry: kstring): proc() =
  result = proc() =
    echo "clicked ", menuEntry

proc buildMenu(menu: seq[kstring]): VNode =
  result = buildHtml(tdiv):
    for m in menu:
      nav(class="navbar is-primary"):
        tdiv(class="navbar-brand"):
          a(class="navbar-item", onclick = menuAction(m)):
```

## Generate HTML with event handlers

TODO: link SSG page to this page

If you are writing a static site generator or do server-side HTML rendering
via ``nim c``, you may want to override ``addEventHandler`` when using event
handlers to avoid compiler complaints.

Here's an example of auto submit a dropdown when a value is selected:

```nim

template kxi(): int = 0
template addEventHandler(n: VNode; k: EventKind; action: string; kxi: int) =
  n.setAttr($k, action)

let
  names = @["nim", "c", "python"]
  selected_name = request.params.getOrDefault("name")
  hello = buildHtml(html):
    form(`method` = "get"):
      select(name="name", onchange="this.form.submit()"):
        for name in names:
          if name == selected_name:
            option(selected = ""): text name
          else:
            option: text name
```
