# Vendor scripts
source ./vendor/starship.nu
source ./vendor/zoxide.nu
source ./vendor/mise.nu
source ./vendor/fzf.nu

# zoxide: complete local directories plus matches from the zoxide database
def "nu-complete zoxide" [place] {
    let token = $place.command | last
    let local = ls -a | where type == dir | get name | where {|d| ($d | str lowercase) starts-with ($token | str lowercase) }
    let ranked = if ($token | is-empty) { ^zoxide query --list --exclude $env.PWD } else { ^zoxide query --list --exclude $env.PWD -- $token } | lines | first 50
    {
        options: {sort: false, completion_algorithm: substring, case_sensitive: false}
        completions: ($local ++ $ranked)
    }
}
def --env --wrapped z [...rest: string@"nu-complete zoxide"] { __zoxide_z ...$rest }

# Completers
use completion/carapace_completer.nu  *
use completion/fish_completer.nu  *
use completion/usage_completer.nu *
use completion/expand_spans.nu *

let completer = {|place|
    let spans = expand_spans $place.command

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

$env.path ++= [$"($env.HOME)/.kilo/bin", $"($env.HOME)/.local/bin", $"($env.HOME)/.cargo/bin", $"($env.HOME)/.local/share/pnpm/bin", "/usr/games", "/snap/bin/"]

# Aliases
alias bazel = bazelisk
alias tssh = tailscale ssh
alias rg = rg -. -g '!/dev' -g '!/proc'
alias zed = zeditor
alias 0x0st = curl -F file=@- https://0x0.st
alias docker = podman
alias compose = docker compose
alias mx = mise x
alias htop = btop
alias top = btop
alias l = ls -a
alias ll = ls -la
alias e = eza -a
alias ee = eza -la

def isonow [] { date now | format date "%FT%T%Z" }

def --wrapped rm [...rest] { cowsay 'This command permanently deletes files, use trash instead. If you really want to remove permanently, use ^rm.' }
def --wrapped mise [...rest] {
  if ($rest | get 0?) == "en" {
    ^mise en --shell=nu ...($rest | slice 1..)
  } else {
    ^mise ...$rest
  }
}
