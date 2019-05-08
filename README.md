# smash-bash

A smashing config for bash.

## Prerequisites

You will need the following.

  - [Git](https://git-scm.com/) to manage repos
  - [Docker](https://www.docker.com/) to manage containers
  - [Git Bash Completion](https://git-scm.com/book/en/v1/Git-Basics-Tips-and-Tricks) (optional)

## Install

Run the following to get started.

    git clone https://github.com/benthorner/smash-bash.git $HOME/.smash-bash

Then add the following to ''.bashrc'' (linux) or ''.profile'' (mac).

    source $HOME/.smash-bash/bashrc

Now close and restart your terminal.

## Features

The following aliases are helpful.

  - `ga` is `git add`
  - `gaa` is `git add -A`
  - `gc` is `git commit`
  - `gca` is `git commit --amend`
  - `gco` is `git checkout`
  - `gl` is a pretty git log
  - `gst` is `git status -sb`
  - `gp` is `git push`
  - `gpl` is `git pull`
  - `grc` is `git rebase --continue`
  - `gs` is `git stash`
  - `gsp` is `git stash pop`
  - `dps` is `docker ps -a`
  - `dca` cleans up docker trash

It does a few other great things too.

  - up/down will autocomplete from history
  - git will auto-rebase and look prettier
  - vim is the default editor (e.g. for Git)
  - rake, rspec, etc. run as bundle exec xxx
  - bash prompt will become `<dir>?<git branch>`
