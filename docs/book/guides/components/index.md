
<div style="color: #f53;border: 1px solid #f53;padding: .5em .7em;border-radius: .25em;">TODO: rewrite this page</div>

## Components

### Composing and Reusability
Unlike other web frameworks, Karax doesn't have explicit components.
Instead, it gives you the freedom to organize your code how you want.

So, to mimic what components do we can just use functions.

```nim
include karax/prelude
type Task = ref object
  id: int
  text: kstring
var tasks = @[
  Task(id: 0, text: "Buy milk"),
  Task(id: 1, text: "Clean table"),
  Task(id: 2, text: "Call mom")
]
proc render(t: Task): VNode =
  buildHtml(li):
    text t.text

proc createDom(): VNode =
  buildHtml(tdiv):
    ol:
      for task in tasks:
        task.render()

setRenderer createDom
```
With this, we can easily divide up parts of a more complex application.
Function arguments can take the place of "props", and we're not constrained by "components" in any way.

We've briefly covered many of the features that Karax offers.
Interested in more? Continue reading for more advanced topics!
