<div align="center">

# asdf-xterrafile [![Build](https://github.com/signavio/asdf-xterrafile/actions/workflows/build.yml/badge.svg)](https://github.com/signavio/asdf-xterrafile/actions/workflows/build.yml) [![Lint](https://github.com/signavio/asdf-xterrafile/actions/workflows/lint.yml/badge.svg)](https://github.com/signavio/asdf-xterrafile/actions/workflows/lint.yml)


[xterrafile](https://github.com/signavio/xterrafile) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Why?](#why)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

- `bash`, `curl`, `tar`, `gunzip`: generic POSIX utilities.

# Install

Plugin:

```shell
asdf plugin add xterrafile
# or
asdf plugin add xterrafile https://github.com/signavio/asdf-xterrafile.git
```

xterrafile:

```shell
# Show all installable versions
asdf list-all xterrafile

# Install specific version
asdf install xterrafile latest

# Set a version globally (on your ~/.tool-versions file)
asdf global xterrafile latest

# Now xterrafile commands are available
xterrafile --version
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/signavio/asdf-xterrafile/graphs/contributors)!

## Testing
```bash
asdf plugin-test xterrafile https://github.com/signavio/asdf-xterrafile --asdf-tool-version latest --asdf-plugin-gitref $(git rev-parse HEAD) xterrafile --version
```


# License

See [LICENSE](LICENSE) © [signavio](https://github.com/signavio/)
