# rubberstamp: GitHub Action to fix GitHub Actions

# ABOUT

## Problem

In a weaksauce attempt to cut costs, GitHub Actions stops triggering `cron` scheduled actions after a period of inactivity. With deleterious security implications.

Why does this matter?

Like other security tools, Dependabot and CodeQL have gaps, which are filled in by configuring GitHub Actions to run additional security tools. Hence the need for (GitHub Actions) CI/CD.

Triggering actions on commit events has gaps, in terms of timing. Attackers don't wait for new commits to take advantage of the latest vulnerabilities. Consider a project where most workers leave for the weekend. The last commit is on Thursday. After work on Friday, researchers announce a new vulnerability that impacts the project. But no new commits arrive, so no new scans are run.

But it gets worse. As a project naturally ages, the number of commits reduces over time. But the likelihood of vulnerabilities increases with time. When the project is most in need of security scanning, commit-based triggers no longer fire. Hence the need for recurring CI/CD.

## Solution

We implement a new GitHub Action to rubberstamp a repository with nonce commits. In order to restore the accuracy of `cron` schedules for all of the repository's actions.

See [.github/workflows/rubberstamp.yml](.github/workflows/rubberstamp.yml).

# LICENSE

BSD-2-Clause

# USAGE

Install rubberstamp on each affected repository.

# INSTALL

1. Use `ssh-keygen` to create an auxiliary SSH keypair for the rubberstamp GitHub Action to authenticate to GitHub.
2. Register auxiliary public key with a GitHub owner account.
3. Register auxiliary private key as a GitHub Actions Repository Secret.
4. Copy the [rubberstamp.yml](.github/workflows/rubberstamp.yml) action configuration file to `.github/workflows`.
5. Temporarily configure `cron` interval to `*/15 * * * *` (every 15 minutes), pushing the altered configuration to the remote. This assists with verifying successful installation.
6. Reset `cron` to a longer interval, one that is still fast enough to beat the GitHub Actions shutoff interval. Push the reset configuration to the remote.

# UNINSTALL

1. Remove `.github/workflows/rubberstamp.yml` from git version control.
2. Remove auxiliary private key from GitHub Actions Repository Secrets.
3. Remove auxiliary public key from GitHub owner account.

# CONTRIBUTING

For more information on developing rubberstamp itself, see [DEVELOPMENT.md](DEVELOPMENT.md).

🔴
