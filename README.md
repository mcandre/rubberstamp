# rubberstamp: GitHub Action to fix GitHub Actions

# ABOUT

## Problem

In a weaksauce attempt to cut costs, GitHub Actions stops triggering `cron` scheduled actions after a period of inactivity. This breaks important, recurring security scans.

Software vulnerabilities accrue most rapidly on exactly the kinds of old, stale projects that receive few recent commits. And every component downstream ends up inheriting these vulnerabilities. Commit-based triggers are insufficient for identifying vulnerabilities in a timely manner. Hence the need for recurring scans.

Dependabot is insufficient, because like every other SCA tool, Dependabot's CVE report often has mutually exclusive gaps compared with the other tools. We need (recurring) GitHub Actions, to in order to responsibly layer on additional SCA security scans.

CodeQL has a similar story to Dependabot for linting / SAST. Except CodeQL isn't even enabled by default. We need recurring GitHub Actions, to in order to responsibly layer on additional SAST security scans.

All of this contributes to a default *insecure* state for the vast majority of GitHub repositories, including public FOSS and private projects.

## Solution

We declare a new recurring GitHub Action to rubberstamp the project with a nonce commit every so often. The action modifies a `.rubberstamp` text file.

See [.github/workflows/rubberstamp.yml](.github/workflows/rubberstamp.yml).

# LICENSE

BSD-2-Clause

# USAGE

Once the rubberstamp action is installed on a GitHub repository, GitHub Actions can automatically resume processing all `cron` triggered actions on that repository.

For best effect, install rubberstamp on each affected repository.

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
