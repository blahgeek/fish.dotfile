function fish_appearance_update
    fish_sunwait_update
    set -l konsole_profiles "Font=Fira Mono"

    if test "$SUNWAIT_STATUS" = "DAY"
        set konsole_profiles "$konsole_profiles;ColorScheme=SolarizedLight"
        set -x -g GTK2_RC_FILES ~/.gtkrc-2.0.light
        set -x -g GTK_THEME Breeze
    else
        set konsole_profiles "$konsole_profiles;ColorScheme=Solarized"
        set -x -g GTK2_RC_FILES ~/.gtkrc-2.0.dark
        set -x -g GTK_THEME Breeze-Dark
    end

    printf "\033]50;%s\a" "$konsole_profiles"
end

