smash_bash
==========

A smashing config for bash. **Warning: This will overwrite your existing config.**

Install
=======

First, the easy way.

```
wget -O $HOME/.bashrc https://raw.githubusercontent.com/benthorner/smash_bash/master/.bashrc
```

Next, the hard(er) way.

```
git clone git@github.com:benthorner/smash_bash.git $HOME/.smash_bash

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
git clone git@github.com:benthorner/smash_bash.git $HOME/.smash_bash
```

That's it.

