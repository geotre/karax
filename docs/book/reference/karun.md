
<div style="color: #f53;border: 1px solid #f53;padding: .5em .7em;border-radius: .25em;">TODO: rewrite this page</div>

## Karun

Karax provides a tiny build tool called ``karun`` that generates the HTML boilerplate code that
embeds and invokes the generated JavaScript code::

``nim c karax/tools/karun``
``karax/tools/karun -r helloworld.nim``

This should compile the file using the `js` backend from Nim and open the file in your default browser!
Note that you can also pass in the `-w` flag to make it so that whenever you save the `ìndex.nim` file, it will automatically rebuild and refresh the page.
