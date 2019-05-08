################################################################
## Constants (Colours)
################################################################

bold="$(tput bold)"
reset="\001$(tput sgr0)\002"
blue="\001$bold$(tput setaf 4)\002"
purple="\001$bold$(tput setaf 5)\002"

################################################################
## Constants (Functions)
################################################################

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
  docker container prune -f
  docker volume rm $(docker volume ls -q -f 'dangling=true' | grep -x '.\{64,\}') 2> /dev/null
  docker image prune -f
}

function command_exists {
  type "$1" &> /dev/null
}

################################################################
## Aliases
################################################################

## Ruby aliases
alias rake='bundle exec rake'
alias rspec='bundle exec rspec --color'
alias rails='bundle exec rails'
alias rubocop='bundle exec rubocop'

## Git aliases
alias ga='git add'
alias gaa='git add -A'
alias gc='git commit'
alias gca='git commit --amend'
alias gco='git checkout'
alias gl='git log --oneline --graph'
alias gst='git status -sb'
alias gp='git push'
alias gpl='git pull'
alias grc='git rebase --continue'
alias gs='git stash'
alias gsp='git stash pop'

## Docker aliases
alias dca='docker_clean_all'
alias dps='docker ps -a'

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

export PS2="-> "
export PS1="$(bash_prompt)\\$\$(git_prompt) "

################################################################
## Config (Vim)
################################################################

export EDITOR=vim
export TERM=xterm-256color vim
