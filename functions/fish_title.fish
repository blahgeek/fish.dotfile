function fish_title
    if not set -q __fish_prompt_hostname
        set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
    end
    echo -n -s "$__fish_prompt_hostname" " "
    echo -n (prompt_pwd)
end
