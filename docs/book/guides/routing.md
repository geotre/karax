
<div style="color: #f53;border: 1px solid #f53;padding: .5em .7em;border-radius: .25em;">TODO: rewrite this page</div>

## Routing


For routing ``setRenderer`` can be called with a callback that takes a parameter of
type ``RouterData``. Here is the relevant excerpt from the famous "Todo App" example:

```nim

proc createDom(data: RouterData): VNode =
  if data.hashPart == "#/": filter = all
  elif data.hashPart == "#/completed": filter = completed
  elif data.hashPart == "#/active": filter = active
  result = buildHtml(tdiv(class="todomvc-wrapper")):
    section(class = "todoapp"):
        ...

setRenderer createDom
```
(Full example [here](https://github.com/karaxnim/karax/blob/master/examples/todoapp/todoapp.nim).)
