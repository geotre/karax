
<div style="color: #f53;border: 1px solid #f53;padding: .5em .7em;border-radius: .25em;">TODO: rewrite this page</div>

## Form validation
Most applications these days have some "login"
mechanism consisting of ``username`` and ``password`` and
a ``login`` button. The login button should only be clickable
if ``username`` and ``password`` are not empty. An error
message should be shown as long as one input field is empty.

To create new UI elements we write a ``loginField`` proc that
returns a ``VNode``:

```nim

proc loginField(desc, field, class: kstring;
                validator: proc (field: kstring): proc ()): VNode =
  result = buildHtml(tdiv):
    label(`for` = field):
      text desc
    input(class = class, id = field, onchange = validator(field))
```

We use the ``karax / errors`` module to help with this error
logic. The ``errors`` module is mostly a mapping from strings to
strings but it turned out that the logic is tricky enough to warrant
a library solution. ``validateNotEmpty`` returns a closure that
captures the ``field`` parameter:

```nim

proc validateNotEmpty(field: kstring): proc () =
  result = proc () =
    let x = getVNodeById(field).getInputText
    if x.isNil or x == "":
      errors.setError(field, field & " must not be empty")
    else:
      errors.setError(field, "")
```

This indirection is required because
event handlers in Karax need to have the type ``proc ()``
or ``proc (ev: Event; n: VNode)``. The errors module also
gives us a handy ``disableOnError`` helper. It returns
``"disabled"`` if there are errors. Now we have all the
pieces together to write our login dialog:


```nim

# some consts in order to prevent typos:
const
  username = kstring"username"
  password = kstring"password"

var loggedIn: bool

proc loginDialog(): VNode =
  result = buildHtml(tdiv):
    if not loggedIn:
      loginField("Name :", username, "input", validateNotEmpty)
      loginField("Password: ", password, "password", validateNotEmpty)
      button(onclick = () => (loggedIn = true), disabled = errors.disableOnError()):
        text "Login"
      p:
        text errors.getError(username)
      p:
        text errors.getError(password)
    else:
      p:
        text "You are now logged in."

setRenderer loginDialog
```

(Full example [here](https://github.com/karaxnim/karax/blob/master/examples/login.nim).)

This code still has a bug though, when you run it, the ``login`` button is not
disabled until some input fields are validated! This is easily fixed,
at initialization we have to do:

```nim

setError username, username & " must not be empty"
setError password, password & " must not be empty"
```
There are likely more elegant solutions to this problem.
