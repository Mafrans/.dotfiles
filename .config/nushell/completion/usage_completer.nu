export def main [get_spec] {
    return {|spans|
        let spec = $"($env.HOME)/.cache/usage/($spans.0).spec"
        if not ($spec | path exists) {
            $spec | path dirname | mkdir $in
            do $get_spec | save -f $spec
        }

        usage complete-word --shell nu -f $spec -- ...$spans | lines
    }
}
