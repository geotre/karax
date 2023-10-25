
## Quickstart

These quickstart examples show the simplest ways to get started with Karax.

For more detailed demos refer to the [examples](/examples/index.html) section of the documentation.

When developing a full app with Karax, you will likely want to use a tool like [Karun](/reference/karun.html). For clarity, these examples do not use Karun and instead use the Nim compiler directly.


### SPA

```bash
cd ~/projects  # or wherever you keep your projects
mkdir mysite
cd mysite
touch app.nim
```

```nim
# app.nim

include karax/prelude

proc index(): VNode =
  return buildHtml(h1):
    text "Hello, world!"

setRenderer(index)
```

```html
<!-- index.html -->
<html>
  <head>
    <title>My first Karax app</title>
  </head>
  <body>
    <div id="ROOT"></div>  <!-- the element that Karax will render the app into -->
    <script src="app.js"></script>
  </body>
</html>
```

```bash
nim js app.nim
```

Now open `index.html` in your browser. You should see "Hello, world!".

Note: Even in development it is advised to use a webserver to serve your files. This is because some browsers do not allow certain features when loading files from the local filesystem.


### SSR

We're going to use `Prologue` as the web server framework in this example, but you can use any framework you like. You can find the Prologue documentation [here](https://planety.github.io/prologue/).

```bash
cd ~/projects  # or wherever you keep your projects
mkdir mysite
cd mysite
touch server.nim
nimble install prologue
```

```nim
# server.nim
import prologue, karax/[karaxdsl, vdom]

proc indexTemplate(): VNode =
  return buildHtml(h1):
    text "Hello, world!"

proc index(ctx: Context) {.async.} =
  resp $indexTemplate()

var app = newApp()
app.addRoute("/", index)
app.run()
```

```bash
nim c -r server.nim
```

Now open `http://localhost:8080` in your browser. You should see "Hello, world!".


### SSG

```bash
cd ~/projects  # or wherever you keep your projects
mkdir mysite
cd mysite
touch generator.nim
```

```nim
# generator.nim
import karax/[karaxdsl, vdom]

proc indexTemplate(): VNode =
  return buildHtml(h1):
    text "Hello, world!"

writeFile("index.html", $indexTemplate())
```

```bash
nim c -r generator.nim
```

Now open `index.html` in your browser. You should see "Hello, world!".

It is straightforward to build a more complex SSG with Karax. For example, you could use the `walkDir` proc from the `os` module to generate a page for each file in a directory.
