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
      entry("autocomplete", "autocomplete.md", false)
      entry("compact", "compact.md", false)
      entry("errors", "errors.md", false)
      entry("i18n", "i18n.md", false)
      entry("jdict", "jdict.md", false)
      entry("jjson", "jjson.md", false)
      entry("jstrutils", "jstrutils.md", false)
      entry("karaxdsl", "karaxdsl.md", false)
      entry("karax", "karax.md", false)
      entry("kbase", "kbase.md", false)
      entry("kdom", "kdom.md", false)
      entry("languages", "languages.md", false)
      entry("localstorage", "localstorage.md", false)
      entry("lookuptables", "lookuptables.md", false)
      entry("reactive", "reactive.md", false)
      entry("vdom", "vdom.md", false)
      entry("vstyles", "vstyles.md", false)

nimibookCli(book)
