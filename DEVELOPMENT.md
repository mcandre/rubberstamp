# BUILDTIME REQUIREMENTS

* [Go](https://go.dev/) 1.24.0+
* POSIX compatible [make](https://pubs.opengroup.org/onlinepubs/9799919799/utilities/make.html)
* [Rust](https://www.rust-lang.org/) 1.75.0+
* [Snyk](https://snyk.io/)
* Provision additional dev tools with `make -f install.mk [-j 4]`

## Recommended

* [ASDF](https://asdf-vm.com/) 0.10 (run `asdf reshim` after provisioning)
* [direnv](https://direnv.net/) 2
* [GNU](https://www.gnu.org/)/[BSD](https://en.wikipedia.org/wiki/Berkeley_Software_Distribution) make

# AUDIT

```console
$ make audit
```

# LINT

```console
$ make [lint]
```
