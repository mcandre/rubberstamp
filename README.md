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

# SETUP

1. Create a new auxiliary SSH keypair with `ssh-keygen` for the Rubberstamp GitHub Action to use to authenticate to GitHub.
2. Register the auxiliary SSH public key with the relevant GitHub repository owner or GitHub org admin account.
3. Register the auxiliary SSH private key as a GitHub Actions Repository Secret, for each GitHub repository.
4. Copy [.github/workflows/rubberstamp.yml](.github/workflows/rubberstamp.yml) to each repository's GitHub Actions `.github/workflows` directory.
5. Temporarily configure `cron` interval to `*/15 * * * *` (every 15 minutes), in order to verify successful installation. Stage, commit, and push the new action.
6. Reset `cron` to a longer interval, but fast enough to beat the silly GitHub Actions shutoff.

# CONTRIBUTING

For more information on developing rubberstamp itself, see [DEVELOPMENT.md](DEVELOPMENT.md).

🔴
