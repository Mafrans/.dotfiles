# Vendor scripts
source ./vendor/starship.nu
source ./vendor/zoxide.nu
source ./vendor/mise.nu
source ./vendor/fzf.nu

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

$env.path ++= [$"($env.HOME)/.kilo/bin", $"($env.HOME)/.local/bin", $"($env.HOME)/.cargo/bin", $"($env.HOME)/.local/share/pnpm/bin", "/usr/games"]

# Aliases
alias bazel = bazelisk
alias tssh = tailscale ssh
def --wrapped ls [...rest] {
    ^ls --color=auto -a ...$rest
}
alias ll = ls -la
alias rg = rg -. -g '!/dev' -g '!/proc'
alias zed = zeditor
alias 0x0st = curl -F file=@- https://0x0.st
alias compose = docker compose
alias mx = mise x
alias htop = btop
alias top = btop
def --wrapped rm [...rest] { cowsay 'This command permanently deletes files, use trash instead. If you really want to remove permanently, use unlink or ^rm.' }
