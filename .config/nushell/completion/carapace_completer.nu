export def main [] {
    return {|spans| carapace $spans.0 nushell ...$spans | from json }
}
