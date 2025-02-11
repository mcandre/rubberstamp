# BUILDTIME REQUIREMENTS

* [ShellCheck](https://www.shellcheck.net/) 0.8.0+
* [Go](https://go.dev/) 1.24.0+
* [GNU](https://www.gnu.org/software/make/) / [BSD](https://man.freebsd.org/cgi/man.cgi?make(1)) make
* [Python](https://www.python.org/) 3.12.1+ with [pipenv](https://pipenv.pypa.io/en/latest/)
* [Rust](https://www.rust-lang.org/) 1.75.0+
* [Snyk](https://snyk.io/)
* Provision additional dev tools with `make -f install.mk [-j 4]`

## Recommended

* [ASDF](https://asdf-vm.com/) 0.10 (run `asdf reshim` after provisioning)
* [direnv](https://direnv.net/) 2

# AUDIT

```console
$ make audit
```

# LINT

```console
$ make [lint]
```
