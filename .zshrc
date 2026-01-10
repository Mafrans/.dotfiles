# Environment
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"
export LD_LIBRARY_PATH="/usr/local/lib"
export MPLBACKEND=module://matplotlib-backend-kitty
export PYTHONPATH="$PYTHONPATH:/home/malte/python-modules"
export NNN_PLUG="f:fzopen;v:preview-tabbed;p:mocq"
export PATH="$PATH:$(go env GOPATH)/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/code/tdde47-labbar/utils"
export ANDROID_HOME="$HOME/Android/Sdk"
export FLYCTL_INSTALL="/home/malte/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"
export OPENROUTER_API_KEY="$(cat /home/malte/.openrouter-key)"
export EDITOR=nvim

# Aliases
alias s="kitten ssh"
alias icat="kitten icat"
alias rg="rg --hyperlink-format=kitty"
alias ls="ls -a"
alias ll="ls -la"
alias zed="zeditor"
alias vpnport="~/scripts/natpmpc_script.sh"
alias mycli="mise x python@3.13.9 -- mycli"

alias nethack="kitty -o window_margin_width=16 -o font_family=\"Mx437 IBM VGA 9x16\" luit -encoding 'CP437' nethack -ibm"
alias files="gtk-launch org.gnome.Nautilus"

# Plugins
autoload -U down-line-or-beginning-search
autoload -U up-line-or-beginning-search

## ASDF
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)
autoload -Uz compinit && compinit

## ZSH antidote
source "/usr/share/zsh-antidote/antidote.zsh"
antidote load

## ZOxide
eval "$(zoxide init zsh --cmd cd)"

## Starship
eval "$(starship init zsh)"

# Options
## Disable vim mode
bindkey -e

zstyle ':autocomplete:*complete*:*' insert-unambiguous yes
zstyle ':autocomplete:*history*:*' insert-unambiguous yes
zstyle ':autocomplete:menu-search:*' insert-unambiguous yes

## Key bindings
bindkey -e            '^?'      backward-delete-char  # backspace
bindkey -e            '^H'      backward-delete-word  # ctrl+backspace
bindkey -e            '^[[3~'   delete-char           # delete
bindkey -e            '^[[3;5~' kill-word             # ctrl+delete
bindkey -e            '^[[1;5C' forward-word          # ctrl+rightarrow
bindkey -e            '^[[1;5D' backward-word         # ctrl+leftarrow
bindkey -e            '\t'      menu-select           # tab
bindkey -e            '^[[Z'    menu-select           # shift+tab
#bindkey -e            '^[[B'    menu-select           # downarrow
bindkey -M menuselect '\t'      menu-complete         # tab (menuselect)
bindkey -M menuselect '^[[Z'    reverse-menu-complete # shift+tab (menuselect)

