# Environment
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"
export LD_LIBRARY_PATH="/usr/local/lib"
export MPLBACKEND=module://matplotlib-backend-kitty
export PYTHONPATH="$PYTHONPATH:/home/malte/python-modules"
export NNN_PLUG="f:fzopen;v:preview-tabbed;p:mocq"

# Aliases
alias s="kitten ssh"
alias icat="kitten icat"
alias ls="ls -a"
alias ll="ls -la"
files() { nautilus "$@" & }

# Plugins

autoload -U down-line-or-beginning-search
autoload -U up-line-or-beginning-search

## ZSH antidote
source "/usr/share/zsh-antidote/antidote.zsh"
antidote load

## ASDF-VM
. /opt/asdf-vm/asdf.sh

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
bindkey -e            '^[[B'    menu-select           # downarrow
bindkey -M menuselect '\t'      menu-complete         # tab (menuselect)
bindkey -M menuselect '^[[Z'    reverse-menu-complete # shift+tab (menuselect)
