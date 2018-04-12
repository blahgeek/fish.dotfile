function fish_prompt --description 'Write out the prompt'

    set -l last_status $status

    fish_sunwait_update
    set -l konsole_profiles "Font=Fira Mono"

    if test "$SUNWAIT_STATUS" = "DAY"
        set konsole_profiles "$konsole_profiles;ColorScheme=SolarizedLight"
    else
        set konsole_profiles "$konsole_profiles;ColorScheme=Solarized"
    end

    printf "\033]50;%s\a" "$konsole_profiles"

    # Just calculate these once, to save a few cycles when displaying the prompt
    if not set -q __fish_prompt_hostname
        set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
    end

    if set -q SSH_CONNECTION
        echo -n -s (set_color $fish_color_ssh) "[SSH]" (set_color $fish_color_normal) " "
    end

    if set -q VIRTUAL_ENV
        echo -n -s (set_color $fish_color_venv) "(" (basename "$VIRTUAL_ENV") ")" (set_color $fish_color_normal) " "
    end

    echo -n -s (set_color $fish_color_hostname) "$__fish_prompt_hostname" ' '
    echo -n -s (set_color $fish_color_cwd) (prompt_pwd)
    echo -n -s (set_color $fish_color_git) (__fish_git_prompt)
    if test $last_status -ne 0
        echo -n -s (set_color $fish_color_error) "[$last_status]"
    end
    echo -n -s (set_color $fish_color_normal) "> "
end
