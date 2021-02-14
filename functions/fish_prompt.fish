function _fish_git_prompt_custom
    set -l gitdir (git rev-parse --show-toplevel 2> /dev/null || echo ".")
    if test -f "$gitdir"/.fish_git_prompt_skip
        echo " (?)"
    else
        __fish_git_prompt
    end
end

function fish_prompt --description 'Write out the prompt'

    set -l last_status $status
    set -l jobs (count (jobs))

    # Just calculate these once, to save a few cycles when displaying the prompt
    if not set -q __fish_prompt_hostname
        set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
    end

    if test "$INSIDE_EMACS" = "vterm"
        if set -q SSH_CONNECTION
            set -l ssh_connection_arr (string split ' ' $SSH_CONNECTION)
            set -l ssh_host "$ssh_connection_arr[3]"
            set -l ssh_port "$ssh_connection_arr[4]"
            emacs_vterm_cmd set-pwd "/ssh:"$USER"@"$ssh_host"#"$ssh_port":"$PWD
        else
            emacs_vterm_cmd set-pwd $PWD
        end
    end

    if set -q SSH_CONNECTION
        echo -n -s (set_color $fish_color_ssh) "[SSH]" (set_color $fish_color_normal) " "
    end

    if set -q VIRTUAL_ENV
        echo -n -s (set_color $fish_color_venv) "(" (basename "$VIRTUAL_ENV") ")" (set_color $fish_color_normal) " "
    end

    if test $jobs -ne 0
        echo -n -s (set_color $fish_color_jobs) "[J:$jobs]" (set_color $fish_color_normal) " "
    end

    echo -n -s (set_color $fish_color_hostname) "$__fish_prompt_hostname" ' '
    echo -n -s (set_color $fish_color_cwd) (smart_pwd)
    echo -n -s (set_color $fish_color_git) (_fish_git_prompt_custom)
    if test $last_status -ne 0
        echo -n -s (set_color $fish_color_error) "[$last_status]"
    end
    echo -n -s (set_color $fish_color_normal) "> "
end
