# PATH
typeset -U PATH path
path=(
  "$HOME/.local/bin"
  "$HOME/.bin"
  "$HOME/.cargo/bin"
  "$HOME/.golang/bin/"
  "$HOME/.dotnet/tools/"
  "$HOME/.bun/bin"
  "$path[@]"
)
export PATH

# Vars
export EDITOR="vim"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_COMMAND='fd --type file --color=always'
export FZF_DEFAULT_OPTS="--ansi"
export GOPATH="$HOME/.golang"
export LESS="--RAW-CONTROL-CHARS"
export MANPAGER='less -s -M +Gg'
export HISTFILE=~/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000
export DMENU_BLUETOOTH_LAUNCHER=rofi
export _JAVA_AWT_WM_NONREPARENTING=1

#Options
setopt autocd
autoload -U compinit; compinit
bindkey -v

# Aliases
alias q='exit'
alias cat='bat'
alias ls='exa'
alias cd='z'

# FZF
source <(fzf --zsh)

# Yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# Zoxide
eval "$(zoxide init zsh)"

# Starship
eval "$(starship init zsh)"

# Keychain
eval `keychain -q --eval github_ed25519 express_vps`
