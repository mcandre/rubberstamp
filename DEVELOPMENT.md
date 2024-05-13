# BUILDTIME REQUIREMENTS

* GNU or BSD [findutils](https://en.wikipedia.org/wiki/Find_(Unix))
* POSIX compatible [sh](https://pubs.opengroup.org/onlinepubs/9699919799/utilities/sh.html)
* [Ghostscript](https://www.ghostscript.com/)
* [ShellCheck](https://www.shellcheck.net/) 0.8.0+
* [Go](https://go.dev/) 1.21.5+
* [Python](https://www.python.org/) 3.12.1+
* Provision additional dev tools with `./install`

## Recommended

* [ASDF](https://asdf-vm.com/) 0.10 (run `asdf reshim` after provisioning)
* [direnv](https://direnv.net/) 2

# LINT

```console
$ ./build [lint]
```
