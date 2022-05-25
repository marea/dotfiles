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
path=("$HOME/.local/share/bin" "$HOME/.local/bin" "$HOME/.bin" "$HOME/.npm-modules/bin" "$HOME/.golang/bin" "$HOME/.local/share/gem/ruby/3.0.0/bin" "/usr/local/go/bin" "$path[@]")
export PATH

export GOPATH="$HOME/.golang"
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

export EDITOR="vim"

alias ls='exa'
alias la='exa -a'
alias q='exit'
alias cat='bat'
alias dof='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# color for less and man 
export MANPAGER='less -s -M +Gg'
export LESS="--RAW-CONTROL-CHARS"
lesscolors=$HOME/.bin/.LESS_TERMCAP
[[ -f $lesscolors ]] && . $lesscolors

export FZF_DEFAULT_COMMAND='fd --type file --color=always'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="--ansi"

# nnn config
export NNN_BMS="i:$HOME/Inbox;d:$HOME/Documents;w:$HOME/Working;m:$HOME/Media"
export NNN_COLORS="1111"
export NNN_SSHFS='sshfs -o reconnect,idmap=user'

# Xterm
[ -n "$XTERM_VERSION" ] && transset --id "$WINDOWID" 0.9 >/dev/null


\cat ~/Documents/Notes/TODO | grep "\[ \]"
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
