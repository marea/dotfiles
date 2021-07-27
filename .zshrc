HISTFILE=~/.histfile
HISTSIZE=9999
SAVEHIST=9999
setopt autocd
unsetopt extendedglob
bindkey -v
zstyle :compinstall filename '/home/marea/.zshrc'
autoload -Uz compinit
compinit
eval "$(starship init zsh)"

typeset -U PATH path
path=("$HOME/.local/bin" "$HOME/.bin" "$HOME/.npm-modules/bin" "$HOME/.golang/bin" "$HOME/.local/share/gem/ruby/3.0.0/bin" "$HOME/.emacs.d/bin/" "$path[@]")
export PATH

export GOPATH="$HOME/.golang"
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

alias ls='exa'
alias la='exa -a'
alias q='exit'
alias cat='bat'
alias dof='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
