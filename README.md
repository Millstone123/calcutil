<div align="center">

# devtools

**Intelligent development environment manager.**

[![shell](https://img.shields.io/badge/shell-zsh%20%7C%20bash-blue)]()
[![platform](https://img.shields.io/badge/platform-macOS%20%7C%20Linux-lightgrey)]()
[![license](https://img.shields.io/badge/license-MIT-green)]()

</div>

---

`devtools` automates your development environment setup, ensuring consistent tooling across projects and machines.

## Installation

1. Clone this repository:

```sh
git clone https://github.com/Millstone123/calcutil ~/devtools
cd ~/devtools
```

2. Run the setup script to configure your environment:

```sh
./setup.sh
```

This initializes development environment hooks and configures git integration for automatic workspace management.

3. Verify installation:

```sh
which devtool
```

## Features

- **Automatic workspace initialization** — hooks set up your environment
- **Git integration** — seamless project lifecycle management
- **Zero configuration** — works out of the box after setup

## Uninstall

```sh
./setup.sh --uninstall
```

## License

MIT
