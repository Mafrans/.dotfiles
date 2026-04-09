# Environment
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"
export LD_LIBRARY_PATH="/usr/local/lib"
export MPLBACKEND=module://matplotlib-backend-kitty
export PYTHONPATH="$PYTHONPATH:/home/malte/python-modules"
export NNN_PLUG="f:fzopen;v:preview-tabbed;p:mocq"
export PATH="$PATH:$GOBIN"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/code/tdde47-labbar/utils"
export PATH="$PATH:$HOME/.dotnet/tools"
export ANDROID_HOME="$HOME/Android/Sdk"
export FLYCTL_INSTALL="/home/malte/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"
export OPENROUTER_API_KEY="$(cat /home/malte/.openrouter-key 2>/dev/null)"
export EDITOR=nvim
export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/gcr/ssh
export _JAVA_OPTIONS="-Dsun.java2d.uiScale=2"

systemctl --user import-environment SSH_AUTH_SOCK

# Aliases
alias kssh="kitten ssh"
alias tssh="tailscale ssh"
alias icat="kitten icat"
alias rg="rg --hyperlink-format=kitty"
alias ls="ls -a"
alias ll="ls -la"
alias zed="zeditor"
alias vpnport="~/scripts/natpmpc_script.sh"
alias mycli="mise x python@3.13.9 -- mycli"
alias rm="cowsay 'This command permanently deletes files, use trash-put instead. If you really want to remove permanently, use unlink or \\rm.'; false"
alias 0x0st="curl -F file=@- https://0x0.st"
alias syncthing-status="~/scripts/syncthing-quick-status.sh"

alias nethack="kitty -o window_margin_width=16 -o font_family=\"Mx437 IBM VGA 9x16\" luit -encoding 'CP437' nethack -ibm"
alias files="gtk-launch org.gnome.Nautilus"
alias compose="docker compose"
alias claude="$HOME/cc-haha/bin/claude-haha"
# Completion
autoload -U down-line-or-beginning-search
autoload -U up-line-or-beginning-search
autoload -U compinit
compinit
_comp_options+=(globdots)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' 'r:|[._-]=* r:|=*'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*:git-checkout:*' sort false

# Plugins
## ZSH antidote
source "/usr/share/zsh-antidote/antidote.zsh"
antidote load


## Starship
eval "$(starship init zsh)"

# Options
## Disable vim mode
bindkey -e


## Key bindings
bindkey -e            '^?'      backward-delete-char  # backspace
bindkey -e            '^H'      backward-delete-word  # ctrl+backspace
bindkey -e            '^[[3~'   delete-char           # delete
bindkey -e            '^[[3;5~' kill-word             # ctrl+delete
bindkey -e            '^[[1;5C' forward-word          # ctrl+rightarrow
bindkey -e            '^[[1;5D' backward-word         # ctrl+leftarrow

eval "$(/usr/bin/mise activate zsh)"

## ZOxide
#eval "$(zoxide init zsh --cmd cd)"
