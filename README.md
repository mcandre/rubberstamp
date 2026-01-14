# rubberstamp: GitHub Action to fix GitHub Actions

[![Rubberstamp self test](https://github.com/mcandre/rubberstamp/actions/workflows/rubberstamp.yml/badge.svg)](https://github.com/mcandre/rubberstamp/actions/workflows/rubberstamp.yml) [![license](https://img.shields.io/badge/license-BSD-3)](LICENSE.md) [![Donate](https://img.shields.io/badge/GUMROAD-36a9ae?style=flat&logo=gumroad&logoColor=white)](https://mcandre.gumroad.com/)

# ABOUT

rubberstamp fixes security and futureproofing issues with GitHub Actions CI/CD pipelines, especially for any projects not guaranteed to see continuous development day over day.

## Problem

In a weaksauce attempt to cut costs, GitHub Actions stops triggering `cron` scheduled actions after a period of inactivity. With deleterious security implications.

Why does this matter?

Like other security tools, Dependabot and CodeQL have gaps, which are filled in by configuring GitHub Actions to run additional security scanning tools. Think, `npm audit`, etc. Hence the need for (GitHub Actions) CI/CD.

Triggering actions on commit events has gaps, in terms of timing. Attackers don't wait for new commits to take advantage of the latest vulnerabilities. Consider a project where most workers leave for the weekend. The last commit is on Thursday. After work on Friday, researchers announce a new vulnerability that impacts the project. But no new commits arrive, so no new scans are run.

But it gets worse. As a project naturally ages, the number of commits reduces over time. But the likelihood of vulnerabilities increases with time. When the project is most in need of security scanning, commit triggers no longer fire. Hence the need for recurring CI/CD, until the project is eventually archived.

## Solution

We implement a new GitHub Action to rubberstamp a repository with nonce commits. In order to restore the accuracy of `cron` schedules for all of the repository's actions.

# USAGE

Install rubberstamp on each affected repository.

# INSTALL

## Prerequisites

* Auxiliary SSH keypair generated with [ssh-keygen](https://linux.die.net/man/1/ssh-keygen)
* Public key registered with GitHub owner account
* Private key registered as an `SSH_KEY` GitHub Actions Repository Secret

Copy [rubberstamp.yml](.github/workflows/rubberstamp.yml) to `.github/workflows/`.

# UNINSTALL

Remove `.github/workflows/rubberstamp.yml` from git version control.

# TEST

Temporarily configure the `cron` interval to `*/5 * * * *` (every 5 minutes).

Warning: Validate `cron` schedule syntax for accuracy, such as with [crontab.guru](https://crontab.guru/). Misconfigured schedules may fail to parse; run too infrequently; or run too frequently, risking rate limits.

Warning: Avoid enabling commit triggers for the rubberstamp action other than `cron`. Commit triggers may create a nasty feedback loop, risking rate limits.

If you accidentally trigger an infinite series of jobs, you can quickly recover by either:

* Force pushing the action with all the `on` triggers removed, to relevant remote branches.
* Using the GitHub Web UI to manually disable the job

Note that GitHub Actions does not support multiple `cron` triggers for the same action: It silently selects one of the `cron` schedules as the one and only schedule.

🔴
