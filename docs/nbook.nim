import nimibook

var book = initBookWithToc:
  entry("Overview", "overview.md", numbered = false)

  entry("Installation", "installation.md")
  entry("Quickstart", "quickstart.md")
  entry("Running examples", "running_examples.md")

  section("Tutorial", "tutorial/index.md"):
    draft("Hello world")
    draft("Loading data")
    draft("Reacting to user input")

  section("Guides", "guides/index.md"):
    entry("Debugging", "debugging.md")
    entry("Server side rendering (SSR)", "ssr.md")
    draft("Static site generation (SSG)")
    entry("Event handlers", "event_handlers.md")
    entry("Form validation", "forms.md")
    entry("Routing", "routing.md")

    section("Components", "components/index.md"):
      draft("VComponents")
      draft("Function components")
      draft("Third party")

  section("Reference", "reference/index.md"):
    draft("3rd party nim libraries")
    draft("Interfacing with JS libraries")
    entry("karun", "karun.md")

    section("Performance", "performance/index.md"):
      entry("Strings", "strings.md")

    entry("Events", "events.md")
    entry("Reactivity model", "reactivity.md")
    draft("The buildHtml macro")
    entry("Dom diffing & the vdom", "vdom.md")
    entry("Boolean attributes", "boolean_attributes.md")

    section("Examples", "examples/index.md"):
      draft("Toy chat")
      draft("Todo app")
      draft("Ajax")
      draft("Carousel")
      draft("Media player")
      draft("Kanban")

    section("API", "api/index.md"):
      entry("autocomplete", "autocomplete.md")
      entry("compact", "compact.md")
      entry("errors", "errors.md")
      entry("i18n", "i18n.md")
      entry("jdict", "jdict.md")
      entry("jjson", "jjson.md")
      entry("jstrutils", "jstrutils.md")
      entry("karaxdsl", "karaxdsl.md")
      entry("karax", "karax.md")
      entry("kbase", "kbase.md")
      entry("kdom", "kdom.md")
      entry("languages", "languages.md")
      entry("localstorage", "localstorage.md")
      entry("lookuptables", "lookuptables.md")
      entry("reactive", "reactive.md")
      entry("vdom", "vdom.md")
      entry("vstyles", "vstyles.md")

nimibookCli(book)
