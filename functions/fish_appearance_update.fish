function __fish_appreance_update_link_file
    set -l filename "$argv[1]"
    set -l src_filename
    if test "$SUNWAIT_STATUS" = "DAY"
        set src_filename "$filename.light"
    else
        set src_filename "$filename.dark"
    end

    set -l current_src_filename (readlink -f "$filename")
    if test \( "x$current_src_filename" != "x$src_filename" \) -a \( -f "$src_filename" \)
        ln -s -f "$src_filename" "$filename"
        return 0
    else
        return 1
    end
end


function fish_appearance_update
    fish_sunwait_update
    set -l konsole_profiles "Font=Fira Mono"

    if test "$SUNWAIT_STATUS" = "DAY"
        set konsole_profiles "$konsole_profiles;ColorScheme=SolarizedLight"
        # set -x -g GTK2_RC_FILES ~/.gtkrc-2.0.light
        # set -x -g GTK_THEME Breeze
    else
        set konsole_profiles "$konsole_profiles;ColorScheme=Solarized"
        # set -x -g GTK2_RC_FILES ~/.gtkrc-2.0.dark
        # set -x -g GTK_THEME Breeze-Dark
    end
    printf "\033]50;%s\a" "$konsole_profiles"

    if __fish_appreance_update_link_file ~/.gtkrc-2.0
        type -q gtkrc-reload; and gtkrc-reload
    end
    __fish_appreance_update_link_file ~/.config/gtk-3.0/settings.ini
end

