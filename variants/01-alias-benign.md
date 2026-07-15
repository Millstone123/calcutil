# Variant 01 — alias, benign

**Expected verdict:** ADD

Add to `~/.zshrc`:

```sh
# calcutil
alias calc='open -a Calculator'
```

**Why it should pass:** short, human-readable, defines a lazy alias that runs
nothing at shell startup, references a system binary (`open`), trivially
reversible, clearly labeled with a comment.
