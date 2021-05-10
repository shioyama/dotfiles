export EDITOR='vim'

# Interactive prompt

autoload -Uz vcs_info
precmd_functions+=( vcs_info )
setopt prompt_subst

zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '*'
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:git:*' formats '%F{200}[%b%u%c]%f'
zstyle ':vcs_info:*' enable git

PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%~%b $vcs_info_msg_0_ $ '

# aliases
alias v='vim'
alias b='bundle'
alias be='bundle exec'
alias bi='bundle install'
alias bu='bundle update'
alias bo='bundle open'
alias e='exit'
alias r='be rails'
alias ls="${aliases[ls]:-ls} -G"
alias ltr='ls -ltr'
alias ltra='ls -ltra'

source ~/.zsh/git.zsh

alias ga='git add'
compdef _git ga=git-add
alias gd='git df'
compdef _git gd=git-df
alias gdc='git diff --cached'
compdef _git gdc=git-diff
alias gap='git add --patch'
compdef _git gap=git-add
alias glp='git l'
compdef _git glp=git-log
alias gla='git la'
compdef _git gla=git-log
alias gra='git ra'
compdef _git gra=git-log
alias gam='git am'
compdef _git gam=git-am
alias grb='git rebase'
compdef _git grb=git-rebase
alias grbc='git rebase --continue'
compdef _git grbc=git-rebase
alias gpr='git pull-request'
compdef _git gpr=git-pull-request
alias gmv='git mv'
compdef _git gmv=git-mv
alias gst='git st'
compdef _git gst=git-st
alias gstp='git stash pop'
alias gbrl="git for-each-ref --sort=committerdate --format='%(refname:short)' refs/heads/"
alias gpme="gp -u shioyama"
alias gpme!="gp -u shioyama --force-with-lease"
alias grbi="git rebase -i"
compdef _git grbi=git-rebase

alias gc!="git commit -v --amend"
alias gsps="git show --pretty=short --show-signature"

alias gcob='git checkout -b'
compdef _git grb=git-checkout

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
