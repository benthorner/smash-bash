# smash_bash

A smashing config for bash.

## Install

Run the following to get started.

    git clone https://github.com/benthorner/smash_bash.git $HOME/.smash_bash

Then add the following to ''.bashrc'' (linux) or ''.profile'' (mac).

    source $HOME/.smash_bash/.bashrc

Now close and restart your terminal.

## Features

The following aliases are helpful.

  - `ga` is `git add`
  - `gaa` is `git add -A`
  - `gc` is `git commit`
  - `gco` is `git checkout`
  - `gl` is a pretty git log
  - `gst` is `git status -sb`
  - `dri` is `docker run --rm -it`
  - `dei` is `docker exec -it`
  - `dca` cleans up docker trash

It does a few other great things too.

  - up/down will autocomplete from history
  - git will auto-rebase and look prettier
  - vim is the default editor (e.g. for Git)
  - rake, rspec, etc. run as bundle exec xxx
  - bash prompt will become `<dir>?<git branch>`
