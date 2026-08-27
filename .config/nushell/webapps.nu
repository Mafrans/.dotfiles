#!/usr/bin/env nu

# 1. Detect Firefox Profile Directory (Snap vs APT/PPA)
let snap_dir = ($env.HOME | path join "snap" "firefox" "common" ".mozilla" "firefox")
let standard_dir = ($env.HOME | path join ".mozilla" "firefox")
let firefox_dir = if ($snap_dir | path exists) { $snap_dir } else { $standard_dir }

if not ($firefox_dir | path exists) {
    mkdir $firefox_dir
}

def create-webapp [
    name: string                 
    url: string                  
    display_name: string         
    theme: string = "system"     
    bg_color: string = "rgba(0, 0, 0, 0)" 
    icon: string = "web-browser" 
] {
    let theme_val = match $theme {
        "dark" => 0
        "light" => 1
        _ => 2
    }

    let pattern = $"($firefox_dir)/*webapp-($name)"
    let matches = glob $pattern
    
    let profile_dir = if ($matches | is-empty) {
        firefox -CreateProfile $"webapp-($name)" out+err>| ignore
        
        let new_pattern = $"($firefox_dir)/*webapp-($name)"
        let new_matches = glob $new_pattern
        if ($new_matches | is-empty) {
            error make { msg: $"Failed to find newly created profile directory for webapp-($name)" }
        }
        $new_matches | first
    } else {
        $matches | first
    }

    let user_js_content = (
        r#'user_pref("browser.sessionstore.resume_session_once", false);
user_pref("browser.sessionstore.resume_from_crash", false);
user_pref("browser.cache.disk.enable", false);
user_pref("browser.cache.disk.capacity", 0);
user_pref("browser.cache.disk.filesystem_reported", 1);
user_pref("browser.cache.disk.smart_size.enabled", false);
user_pref("browser.cache.disk.smart_size.first_run", false);
user_pref("browser.cache.disk.smart_size.use_old_max", false);
user_pref("browser.ctrlTab.previews", true);
user_pref("browser.tabs.warnOnClose", false);
user_pref("plugin.state.flash", 2);
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
user_pref("browser.tabs.drawInTitlebar", false);
user_pref("browser.tabs.inTitlebar", 0);
user_pref("browser.contentblocking.category", "strict");
user_pref("network.cookie.lifetimePolicy", 0);
user_pref("layout.css.prefers-color-scheme.content-override", '#
        + ($theme_val | into string)
        + r#');
'#
    )
    $user_js_content | save -f ($profile_dir | path join "user.js")

    let chrome_dir = ($profile_dir | path join "chrome")
    mkdir $chrome_dir

    let user_chrome_content = (
        r#'browser { margin-right: 0px; margin-bottom: 0px; }
#TabsToolbar, #nav-bar { visibility: collapse !important; }
#main-window[windowtype="navigator:browser"] { background-color: transparent !important; }
.tab-background[selected="true"] { background: '#
        + $bg_color
        + r#' !important; }
'#
    )
    $user_chrome_content | save -f ($chrome_dir | path join "userChrome.css")

    # Create Desktop Launcher with Wayland support
    let desktop_dir = ($env.HOME | path join ".local" "share" "applications")
    mkdir $desktop_dir

    let desktop_content = $"[Desktop Entry]
Version=1.0
Type=Application
Name=($display_name)
Comment=Web App for ($display_name)
Exec=env MOZ_ENABLE_WAYLAND=1 firefox --class WebApp-($name) --name WebApp-($name) -P webapp-($name) --no-remote \"($url)\"
Icon=($icon)
Terminal=false
StartupNotify=true
StartupWMClass=WebApp-($name)
MimeType=text/html;text/xml;application/xhtml_xml;
Categories=Network;WebBrowser;
X-MultipleArgs=false
"
    let desktop_file = ($desktop_dir | path join $"webapp-($name).desktop")
    $desktop_content | save -f $desktop_file
    
    chmod +x $desktop_file
}
