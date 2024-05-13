# rubberstamp: GitHub Action to fix GitHub Actions

# ABOUT

## Problem

In a weaksauce attempt to cut costs, GitHub Actions stops triggering `cron` scheduled actions after a period of inactivity. With deleterious security implications.

Why does this matter?

Like other security tools, Dependabot and CodeQL have gaps, which are filled in by configuring GitHub Actions to run additional security scanning tools. Think, `npm audit`, etc. Hence the need for (GitHub Actions) CI/CD.

Triggering actions on commit events has gaps, in terms of timing. Attackers don't wait for new commits to take advantage of the latest vulnerabilities. Consider a project where most workers leave for the weekend. The last commit is on Thursday. After work on Friday, researchers announce a new vulnerability that impacts the project. But no new commits arrive, so no new scans are run.

But it gets worse. As a project naturally ages, the number of commits reduces over time. But the likelihood of vulnerabilities increases with time. When the project is most in need of security scanning, commit-based triggers no longer fire. Hence the need for recurring CI/CD, until the project is eventually archived.

## Solution

We implement a new GitHub Action to rubberstamp a repository with nonce commits. In order to restore the accuracy of `cron` schedules for all of the repository's actions.

See [.github/workflows/rubberstamp.yml](.github/workflows/rubberstamp.yml).

# LICENSE

BSD-2-Clause

# USAGE

Install rubberstamp on each affected repository.

# INSTALL

## Prerequisites

* An auxiliary SSH keypair
* Public key registered with GitHub owner account
* Private key registered as an `SSH_KEY` GitHub Actions Repository Secret

Copy [rubberstamp.yml](.github/workflows/rubberstamp.yml) to `.github/workflows/`.

## Test

Temporarily configure the `cron` interval to `*/15 * * * *` (every 15 minutes).

# UNINSTALL

Remove `.github/workflows/rubberstamp.yml` from git version control.

# CONTRIBUTING

For more information on developing rubberstamp itself, see [DEVELOPMENT.md](DEVELOPMENT.md).

🔴
