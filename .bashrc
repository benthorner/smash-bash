################################################################
## Includes (RVM)
################################################################

[ -s $HOME/.rvm/bin ] && export PATH="$PATH:$HOME/.rvm/bin"
[ -f $HOME/.rvm/scripts/rvm ] && source $HOME/.rvm/scripts/rvm

################################################################
## Constants (Colours)
################################################################

bold="$(tput bold)"
reset="\001$(tput sgr0)\002"

blue="\001$bold$(tput setaf 4)\002"
green="\001$bold$(tput setaf 2)\002"
purple="\001$bold$(tput setaf 5)\002"
red="\001$bold$(tput setaf 1)\002"
yellow="\001$bold$(tput setaf 3)\002"

################################################################
## Constants (Git Log)
################################################################

HASH="%C(green)%h%C(reset)"
AGE="%C(yellow)%ar%C(reset)"
AUTHOR="%C(bold blue)%an%C(reset)"
REFS="%C(bold red)%d%C(reset)"
COMMENT="%s"

FORMAT="$HASH $AGE $AUTHOR $REF $COMMENT"
OPTIONS=("--graph" "--pretty=tformat:$FORMAT")

################################################################
## Constants (Functions)
################################################################

git_pretty_log() {
  git log "${OPTIONS[@]}" $* |
  less -FXRS
}
function git_status_working {
  git diff --quiet &> /dev/null
  echo $?
}

function git_status_staging {
  git diff --quiet --cached &> /dev/null
  echo $?
}

function git_status_colour {
  if [ $(git_status_staging) != 0 ]; then
    echo $red
  elif [ $(git_status_working) != 0 ]; then
    echo $yellow
  else
    echo $green
  fi
}

function git_status {
  git status &> /dev/null
  echo "$?"
}

function git_branch {
  echo "$(git rev-parse --abbrev-ref HEAD)"
}

function git_prompt {
  if [ $(git_status) == 0 ]; then
    echo -e "$(git_status_colour)$(git_branch)$reset"
  fi
}

function bash_prompt {
  echo "$blue\u$reset@$blue\h$reset:$purple\W$reset"
}

################################################################
## Aliases
################################################################

## Ruby aliases
alias cucumber='bundle exec cucumber --color'
alias rake='bundle exec rake'
alias rspec='bundle exec rspec --color'

## Git aliases
alias ga='git add'
alias gaa='git add -A'
alias gc='git commit'
alias gco='git checkout'
alias gl='git_pretty_log'
alias gst='git status -sb'

################################################################
## Bindings (History)
################################################################

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

################################################################
## Config (Git)
################################################################

git config --global branch.autosetuprebase always
git config --global color.ui auto
git config --global push.default current

################################################################
## Config (Bash)
################################################################

## Bash prompt
export PS2="-> "
export PS1="$(bash_prompt)\\$\$(git_prompt) "

## Bash editor
export EDITOR=vim
