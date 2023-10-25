
<div style="color: #f53;border: 1px solid #f53;padding: .5em .7em;border-radius: .25em;">TODO: rewrite this page</div>

## Boolean attributes

Some HTML attributes don't have meaningful values; instead, they are treated like
a boolean whose value is `false` when the attribute is not set, and `true` when
the attribute is set to any value. Some examples of these attributes are `disabled`
and `contenteditable`.

In Karax, these attributes can be set/cleared with a boolean value:

```nim
proc submitButton(dataIsValid: bool): VNode =
  buildHtml(tdiv):
    button(disabled = not dataIsValid):
      if dataIsValid:
        text "Submit"
      else:
        text "Cannot submit, data is invalid!"
```