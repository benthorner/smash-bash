smash_bash
==========

A smashing config for bash.

Install
=======

First, the easy way. **Warning: This will overwrite your existing config.**

```
wget -O $HOME/.bashrc https://raw.githubusercontent.com/benthorner/smash_bash/master/.bashrc
```

Next, the hard(er) way.

```
git clone https://github.com/benthorner/smash_bash.git $HOME/.smash_bash

cat >> $HOME/.bashrc <<EOS
  if [ -f $HOME/.smash_bash/.bashrc ]; then
    source $HOME/.smash_bash/.bashrc
  fi
EOS
```

Now close and restart your terminal.

Update
======

Again with the easy way. **Warning: This will overwrite your existing config (again).**

```
wget -O $HOME/.bashrc https://raw.githubusercontent.com/benthorner/smash_bash/master/.bashrc
```

Now the difficult(er) way.

```
rm -rf $HOME/.smash_bash
git clone https://github.com/benthorner/smash_bash.git $HOME/.smash_bash
```

That's it.

Features
========

Smash Bash is smashing because of its:

  - aliases:
    - It has lots of Git aliases (run `alias` to see them)
    - It has a few Ruby aliases (use bundler with Rake, etc)

  - bindings:
    - It makes the up/down arrow autocomplete from your history

  - configs:
    - It makes Git auto-rebase as well as look pretty
    - It makes `git push` operate on the current branch
    - It makes Vim your default editor (e.g. for Git)

It also loads RVM if its installed.

Credits
=======

Most of this config was snitched from [Adam Whittingham](https://github.com/AdamWhittingham/bash-config "Adam's Bash Config").

Thanks Adam!
