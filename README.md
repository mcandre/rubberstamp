# rubberstamp: GitHub Action to fix GitHub Actions

# ABOUT

## Problem

In a shortsighted attempt to cut costs, GitHub disables recurring GitHub Actions for FOSS projects after a period of inactivity. Including important security scans. Even though new CVE's are discovered retroactively, *particularly* for old, stale projects.

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
