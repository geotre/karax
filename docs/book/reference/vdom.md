
<div style="color: #f53;border: 1px solid #f53;padding: .5em .7em;border-radius: .25em;">TODO: rewrite this page</div>

## DOM diffing

Ok, so now we have seen DOM creation and event handlers. But how does
Karax actually keep the DOM up to date? The trick is that every event
handler is wrapped in a helper proc that triggers a *redraw* operation
that calls the *renderer* that you initially passed to ``setRenderer``.
So a new virtual DOM is created and compared against the previous
virtual DOM. This comparison produces a patch set that is then applied
to the real DOM the browser uses internally. This process is called
"virtual DOM diffing" and other frameworks, most notably Facebook's
*React*, do quite similar things. The virtual DOM is faster to create
and manipulate than the real DOM so this approach is quite efficient.

# Virtual DOM

The virtual dom is in the ``vdom`` module.

The ``VNodeKind`` enum describes every tag that the HTML 5 spec includes
and some extensions that allow for an efficient component system.

These extensions are:

``VNodeKind.int``
     The node has a single integer field.

``VNodeKind.bool``
     The node has a single boolean field.

``VNodeKind.vthunk``
     The node is a `virtual thunk`:idx:. This means there is a
     function attached to it that produces the ``VNode`` structure
     on demand.

``VNodeKind.dthunk``
     The node is a `DOM thunk`:idx:. This means there is a
     function attached to it that produces the ``Node`` DOM structure
     on demand.

Since ``div`` is a keyword in Nim, karax choose to use ``tdiv`` instead.
``tdiv`` produces a ``<div>`` virtual DOM node.

For convenience of the resulting Nim DSL these tags have enum names
that differ from their HTML equivalent:

=================     =======================================================
Enum value            HTML
=================     =======================================================
``tdiv``              ``div``  (changed because ``div`` is a keyword in Nim)
``italic``            ``i``
``bold``              ``b``
``strikethrough``     ``s``
``underlined``        ``u``
=================     =======================================================


A virtual dom node also has a special field set called ``key``, an integer
that can be used as a data model specific key/id. It can be accessed in event
handlers to change the data model. See the todoapp for an example of how to
use it.

**Note**: This is not a hint for the DOM diff algorithm, multipe nodes can
all have the same key value.
