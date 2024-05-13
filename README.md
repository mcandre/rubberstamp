# rubberstamp: GitHub Action to fix GitHub Actions

# ABOUT

## Problem

In a shortsighted attempt to cut costs, GitHub disables recurring GitHub Actions for FOSS projects after a period of inactivity. Including important security scans. Which is backwards, because software vulnerabilities accrue most rapidly on old, stale projects. Every component downstream ends up inheriting the vulnerabilities.

This results in a default *insecure* state for the vast majority of GitHub repositories, including public FOSS and private projects.

Dependabot is not a complete answer, because Dependabot reports often omit vulnerabilities indicated by other SCA systems.

## Solution

We declare a recurring GitHub Action to update a nonce file in version control.

The new action periodically updates a `.rubberstamp` text file with the current timestamp.

See [.github/workflows/rubberstamp.yml](.github/workflows/rubberstamp.yml).

# LICENSE

BSD-2-Clause

# INSTALL

1. Register SSH public key with the relevant GitHub repository owner or GitHub org admin account.
2. Register SSH private key as a GitHub Actions Secret for each GitHub repository.
3. Run `cp rubberstamp/.github/workflows/rubberstamp.yml <some-repository>/.github/workflows/rubberstamp.yml`
4. Temporarily configure `cron` interval to `*/15 * * * *` (every 15 minutes), in order to verify successful installation.
5. Reset `cron` to a longer interval, but fast enough to beat the silly GitHub Actions shutoff.

# UNINSTALL

```console
$ rm <some-repository>/.github/workflows/rubberstamp.yml
```

# CONTRIBUTING

For more information on developing rubberstamp itself, see [DEVELOPMENT.md](DEVELOPMENT.md).

🔴
