<div align="center">

# asdf-task [![Build](https://github.com/signavio/asdf-task/actions/workflows/build.yml/badge.svg)](https://github.com/signavio/asdf-task/actions/workflows/build.yml) [![Lint](https://github.com/signavio/asdf-task/actions/workflows/lint.yml/badge.svg)](https://github.com/signavio/asdf-task/actions/workflows/lint.yml)


[task](https://github.com/go-task/task) plugin for the [asdf version manager](https://asdf-vm.com).

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
asdf plugin add task
# or
asdf plugin add task https://github.com/signavio/asdf-task.git
```

task:

```shell
# Show all installable versions
asdf list-all task

# Install specific version
asdf install task latest

# Set a version globally (on your ~/.tool-versions file)
asdf global task latest

# Now task commands are available
task --version
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/signavio/asdf-task/graphs/contributors)!

## Testing
```bash
asdf plugin-test task https://github.com/signavio/asdf-task --asdf-tool-version latest --asdf-plugin-gitref $(git rev-parse HEAD) task --version
```


# License

See [LICENSE](LICENSE) © [signavio](https://github.com/signavio/)
