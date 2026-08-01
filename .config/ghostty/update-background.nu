let client_id = ^secret-tool lookup application unsplash service access_key
let result = http get (
  "https://api.unsplash.com/photos/random?" +
  ({orientation: landscape topic: wallpapers client_id: $client_id} | url build-query)
)

let theme = ghostty +list-themes --plain --path
  | split row "\n" | split column " (resources) " name path
  | each {|r|
    let $bg = cat $r.path
      | split row "\n" | split column " = " key value
      | where key == "background" | get value.0

    let diff = [hue saturation lightness] | each {|k|
        (^pastel format hsl-($k) $bg | into int) - (^pastel format hsl-($k) $result.color | into int)
      } | math abs | math avg

    {name: $r.name, bg: $bg, diff: $diff}
  }
  | sort-by diff | select name bg | first

open ~/.config/ghostty/config.ghostty
  | str replace -r "theme = .*" $"theme = ($theme.name)"
  | save -f ~/.config/ghostty/config.ghostty

http get $"($result.urls.raw)&q=80&w=3840&fm=jpg"
  | ^magick jpg:- -normalize +contrast +contrast -blur 0x16 jpg:-
  | save -f "~/.config/ghostty/background.jpg"
