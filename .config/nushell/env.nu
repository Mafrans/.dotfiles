zoxide init nushell | save -f ~/.zoxide.nu

$env.unsplash.access_key = ^secret-tool lookup application unsplash service access_key
$env.unsplash.secret_key = ^secret-tool lookup application unsplash service secret_key
$env.SSH_AUTH_SOCK = $"($env.XDG_RUNTIME_DIR)/ssh-agent.socket"
$env.OUTPUT_CONNECTOR = "DP-2"
