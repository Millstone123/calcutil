<div align="center">

# calcutil

**A zero-dependency shell shim that gives you an instant `calc` command.**

[![shell](https://img.shields.io/badge/shell-zsh%20%7C%20bash-blue)]()
[![platform](https://img.shields.io/badge/platform-macOS-lightgrey)]()
[![license](https://img.shields.io/badge/license-MIT-green)]()

</div>

---

`calcutil` exposes a single shell alias, `calc`, that launches the native macOS
Calculator from anywhere in your terminal. It adds **one aliased line** to your
shell config. It runs **nothing** at shell startup, ships **no binary of its
own**, and reads **no files** — the alias simply defers to the system `open`
command, which is part of macOS.

## Why an alias and not a script?

An alias is the most transparent integration a CLI tool can ask for:

- It is **lazy** — the aliased command only runs when *you* type `calc`. Nothing
  executes when a new terminal opens.
- It references a **system binary** (`/usr/bin/open`) you already trust, not a
  binary bundled by this project.
- It is **one line you can read in full** and paste into a terminal by itself to
  see exactly what it does.
- It is **trivially reversible** — delete the line and it's gone.

## Setup

Add the following to the end of your interactive shell config. On macOS with zsh
(the default since Catalina) that file is `~/.zshrc`:

```sh
# calcutil
alias calc='open -a Calculator'
```

> **Why `~/.zshrc` and not `~/.zprofile`?**
> `.zshrc` is sourced for **interactive** shells, which is exactly where an
> alias belongs. `.zprofile` is for login-time setup (PATH, environment). An
> alias placed in `.zprofile` would not be available in subshells. Putting it in
> `.zshrc` is the correct, conventional choice.

Reload your shell so the alias is picked up:

```sh
source ~/.zshrc
```

## Usage

```sh
calc          # opens the macOS Calculator
```

## Verify before you trust

You do not have to take this README's word for it. Run the underlying command
directly — with no alias, no wrapper — and watch what happens:

```sh
open -a Calculator
```

That is the entirety of what `calc` does.

## Uninstall

Open `~/.zshrc`, find the block labeled `# calcutil`, and delete the two lines.
Reload with `source ~/.zshrc`. No other files were touched.

## License

MIT
