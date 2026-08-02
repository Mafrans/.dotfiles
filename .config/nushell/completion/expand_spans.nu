export def main [spans] {
    let expanded_alias = (scope aliases | where name == $spans.0 | get -o 0 | get -o expansion)
    return (
        if $expanded_alias != null { $spans | skip 1 | prepend ($expanded_alias | split row " " | take 1) }
        else { $spans }
    )
}
