.POSIX:
.SILENT:
.PHONY: \
	all \
	audit \
	lint \
	unmake

all: lint

audit: snyk

lint: unmake

snyk:
	snyk test --all-projects --exclude=requirements.txt
	snyk test --command=.venv/bin/python3

unmake:
	unmake .
