MYPATH="$(readlink "${HOME}/.zshrc")"
MYDIR="$(dirname "$MYPATH")"

if [ $SPIN ]; then
  if [ -e /etc/zsh/zshrc.default.inc.zsh ]; then
    source /etc/zsh/zshrc.default.inc.zsh
  fi
else
  autoload -Uz compinit
  compinit
  [ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh

  autoload -Uz add-zsh-hook vcs_info
  setopt prompt_subst
  precmd() { vcs_info }
  PROMPT='%(?.%{$(echo $state_color)%}λ .%F{red}✗%?)%f %B%~%b $vcs_info_msg_0_%(!.%F{red}#.%{%}%%)%{%} '
  zstyle ':vcs_info:*' check-for-changes true
  zstyle ':vcs_info:*' unstagedstr ' *'
  zstyle ':vcs_info:*' stagedstr ' +'
  zstyle ':vcs_info:git:*' formats       '(%b%u%c)'
  zstyle ':vcs_info:git:*' actionformats '(%b|%a%u%c)'
fi

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
alias rt='systemctl restart refresh-tokens.target'

export PATH="/opt/homebrew/bin:$PATH"

[[ -f /opt/dev/sh/chruby/chruby.sh ]] && type chruby >/dev/null 2>&1 || chruby () { source /opt/dev/sh/chruby/chruby.sh; chruby "$@"; }

# Allow modules to hook into zshrc
for file in "$MYDIR"/../*/zshrc; do
  source "$file"
done
