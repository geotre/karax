# Package

version       = "1.3.1"
author        = "Andreas Rumpf"
description   = "Karax is a framework for developing single page applications in Nim."
license       = "MIT"

# Dependencies

requires "nim >= 0.18.0"
requires "ws"
requires "dotenv >= 2.0.0"
skipDirs = @["examples", "experiments", "tests"]

bin = @["karax/tools/karun"]
installExt = @["nim"]

task nimibook, "Compiles the nimibook docs":
  cd "docs"
  rmDir "dist"
  exec "nimble install -y nimib@#head nimibook@#head"
  exec "nim c nbook.nim"
  exec "./nbook update"
  exec "./nbook build"

task apidocs, "docs only for api":
  rmDir "docs/dist/apidocs"
  mkDir "docs/dist/apidocs"

  exec(
    "nim doc --backend:js --verbosity:0 --warnings:off " &
    "--out:docs/dist/apidocs/karax --project:on " &
    "--git.url:https://github.com/karaxnim/karax --git.commit:master " &
    "karax/karax.nim"
  )

  # now do the modules that weren't done by the above
  for m in [
    "autocomplete", "errors", "i18n", "jjson", "karaxdsl",
    "languages", "localstorage", "lookuptables", "reactive"
  ]:
    exec(
      "nim doc --backend:js --verbosity:0 --warnings:off " &
      "--out:docs/dist/apidocs/karax/" & m & ".html " &
      "--git.url:https://github.com/karaxnim/karax --git.commit:master " &
      "karax/" & m & ".nim"
    )

task docs, "build docs":
  exec "nimble nimibook"
  exec "nimble apidocs"
