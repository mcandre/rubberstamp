# rubberstamp: GitHub Action to fix GitHub Actions

# ABOUT

## Problem

In a shortsighted attempt to cut costs, GitHub disables recurring GitHub Actions for FOSS projects after a period of inactivity. Including important security scans. Which is backwards, because software vulnerabilities accrue most rapidly on old, stale projects. Every component downstream ends up inheriting the vulnerabilities.

This results in a default *insecure* state for the vast majority of GitHub repositories, including public FOSS and private projects.

Dependabot is not a complete answer, because Dependabot reports often omit vulnerabilities indicated by other SCA systems.

## Solution

We declare a recurring GitHub Action to update a nonce file in version control.

See [.github/workflows/rubberstamp.yml](.github/workflows/rubberstamp.yml).

# LICENSE

BSD-2-Clause

# REQUIREMENTS

* GitHub Actions
* SSH public key registered with repository owner or org admin
* SSH private key registered as a GitHub Secret

GitHub is doubly nasty, refusing to implement per-org secrets for personal orgs. Many users will have to configure the secret per-repository, creating yet more maintenance nightmares. Good luck!

# CONTRIBUTING

For more information on developing rubberstamp itself, see [DEVELOPMENT.md](DEVELOPMENT.md).

🔴
