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

# git aliases
source ~/.zsh/git.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# tmux by default
if [ -z "$tmux" ] && [ -n "$ssh_tty" ] && [[ $- =~ i ]]; then
    tmux -cc attach-session || tmux -cc new-session
    exit
fi
