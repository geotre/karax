
<div style="color: #f53;border: 1px solid #f53;padding: .5em .7em;border-radius: .25em;">TODO: rewrite this page</div>

#### `kstring` vs `string` vs `cstring`
As you may have noticed above, we made `list` into a seq[kstring] rather than a seq[string].
If you've ever worked with Nim's `js` backend, you would know that Javascript strings are different from Nim strings. 
Nim uses the `cstring` type to denote a "compatible string". 
In our case, this corresponds to the native Javascript string type. 
In fact, if you try using Nim's string type on the Javascript backend, you'll get something like:
```
[45, 67, 85, 34, ...]
```
This is how Nim strings are handle internally - a sequence of numbers.
We use `cstring` to avoid taking a performance penalty when working with strings, as the native string type is faster than a list of numbers.

What is `kstring` then? `kstring` corresponds to a `cstring` when compiled using the `js` backend, and a `string` otherwise.
This makes it much easier to write code that can be used on multiple platforms.
