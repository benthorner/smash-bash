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

FORMAT="$HASH $AGE $AUTHOR $REFS $COMMENT"
OPTIONS=("--graph" "--pretty=tformat:$FORMAT")

################################################################
## Constants (Functions)
################################################################

function git_pretty_log() {
  git log "${OPTIONS[@]}" $* | less -FXRS
}

function git_branch {
  echo "$(git rev-parse --abbrev-ref HEAD)"
}

function git_prompt {
  if git branch &> /dev/null; then
    echo -e "$blue$(git_branch)$reset"
  fi
}

function bash_prompt {
  echo "$purple\W$reset"
}

function docker_clean_all {
  docker rm $(docker ps -q -f status=exited) 2> /dev/null
  docker volume rm $(docker volume ls -q -f dangling=true) 2> /dev/null
  docker rmi $(docker images -q -f dangling=true) 2> /dev/null
}

function command_exists {
  type "$1" &> /dev/null
}

################################################################
## Aliases
################################################################

## Ruby aliases
alias cucumber='bundle exec cucumber --color'
alias rake='bundle exec rake'
alias rspec='bundle exec rspec --color'
alias rubocop='bundle exec rubocop'

## Git aliases
alias ga='git add'
alias gaa='git add -A'
alias gc='git commit'
alias gco='git checkout'
alias gl='git_pretty_log'
alias gst='git status -sb'

## Docker aliases
alias dri='docker run --rm -it'
alias dei='docker exec -it'
alias dca='docker_clean_all'

################################################################
## Bindings (History)
################################################################

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

################################################################
## Config (Git)
################################################################

if command_exists git; then
  git config --global branch.autosetuprebase always
  git config --global color.ui auto
  git config --global push.default current
fi

if command_exists __git_complete; then
  __git_complete gco _git_checkout
fi

################################################################
## Config (Bash)
################################################################

## Bash prompt
export PS2="-> "
export PS1="$(bash_prompt)\\$\$(git_prompt) "

## Bash editor
export EDITOR=vim

################################################################
## Config (Vim)
################################################################

export TERM=xterm-256color vim
