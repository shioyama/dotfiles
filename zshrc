if [ $SPIN ]; then
  if [ -e /etc/zsh/zshrc.default.inc.zsh ]; then
    source /etc/zsh/zshrc.default.inc.zsh
  fi

  export EDITOR='vim.gtk3'
  alias v='vim.gtk3 -v'
else
  autoload -Uz compinit
  compinit
  echo 'export PATH="/opt/homebrew/bin:$PATH"' >> ~/.zshrc
  [ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh
  alias v='vim'
fi

# Interactive prompt

# autoload -Uz vcs_info
# precmd_functions+=( vcs_info )
# setopt prompt_subst
# setopt share_history
# setopt extended_history
# setopt hist_find_no_dups
# export HISTTIMEFORMAT="[%F %T] "
# export HISTFILE=~/.zsh_history
# export HISTFILESIZE=10000000
# export HISTSIZE=10000000

# zstyle ':vcs_info:git:*' check-for-changes true
# # zstyle ':vcs_info:*' unstagedstr '*'
# # zstyle ':vcs_info:*' stagedstr '+'
# zstyle ':vcs_info:git:*' formats '%F{200}[%b%u%c]%f'
# zstyle ':vcs_info:*' enable git

# PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%~%b $vcs_info_msg_0_ $ '

# aliases
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
alias ss='spin shell'

# git aliases
source ~/.zsh/git.zsh

eval "$(hub alias -s)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# tmux by default
# if [ -z "$TMUX" ] && [ -n "$SSH_TTY" ] && [[ $- =~ i ]]; then
#     tmux -CC attach-session || tmux -CC new-session
#     exit
# fi
export PATH="/opt/homebrew/bin:$PATH"

[[ -f /opt/dev/sh/chruby/chruby.sh ]] && type chruby >/dev/null 2>&1 || chruby () { source /opt/dev/sh/chruby/chruby.sh; chruby "$@"; }
[[ -x /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)
