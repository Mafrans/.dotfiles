# Completers
use completion/carapace_completer.nu  *
use completion/fish_completer.nu  *
use completion/usage_completer.nu *
use completion/expand_spans.nu *


let completer = {|spans|
    let spans = expand_spans $spans

    match $spans.0 {
        mise => (usage_completer {mise usage})
        nu => (fish_completer)
        git => (fish_completer)
        _ => (carapace_completer)
    } | do $in $spans
}

# Configuration

$env.config.buffer_editor = "nvim"
$env.config.show_banner = false
$env.config.table.mode = "none"
$env.config.table.padding.right = 0
$env.config.completions.external = {
  enable: true
  completer: $completer
}

$env.PKG_CONFIG_PATH = "/usr/local/lib/pkgconfig"
$env.LD_LIBRARY_PATH = "/usr/local/lib"
$env.ANDROID_HOME = "~/Android/Sdk"

$env.path ++= ["~/.local/bin", "~/.cargo/bin"]


alias tssh = tailscale ssh
alias ls = ls -a
alias ll = ls -la
alias rg = rg -. -g '!/dev' -g '!/proc'
alias zed = zeditor
alias 0x0st = curl -F file=@- https://0x0.st
alias compose = docker compose
alias mx = mise x
alias htop = btop
alias top = btop
def rm [...rest] { cowsay 'This command permanently deletes files, use trash instead. If you really want to remove permanently, use unlink or \rm.' }


source ~/.config/nushell/starship.rs
source ~/.zoxide.nu
source ~/.mise.nu
