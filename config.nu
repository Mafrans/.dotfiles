$env.PKG_CONFIG_PATH = "/usr/local/lib/pkgconfig"
$env.LD_LIBRARY_PATH = "/usr/local/lib"
$env.ANDROID_HOME = "~/Android/Sdk"
$env.EDITOR = "/usr/bin/nvim"
$env._JAVA_OPTIONS = "-Dsun.java2d.uiScale=2"

alias tssh = tailscale ssh
alias ls = ls -a
alias ll = ls -la
alias zed = zeditor
alias rm = cowsay 'This command permanently deletes files, use trash-put instead. If you really want to remove permanently, use unlink or \\rm.'; false
alias 0x0st = curl -F file=@- https://0x0.st

alias compose = docker compose

source ~/.config/nu/starship.rs
