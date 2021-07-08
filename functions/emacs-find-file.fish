function emacs-find-file -d "Find file inside emacs"
    set -l filename $argv[1]

    if test -e $filename
        set filename (realpath $filename)
    end

    if not test -r $filename
        set filename "/sudo::"$filename
        read -P "File is not readable, try opening $filename. Continue?"
    else if set -q SSH_CONNECTION
        set -l ssh_connection_arr (string split ' ' $SSH_CONNECTION)
        set -l ssh_host "$ssh_connection_arr[3]"
        set -l ssh_port "$ssh_connection_arr[4]"
        set filename "/ssh:"$USER"@"$ssh_host"#"$ssh_port":"$filename
    end

    echo "Finding file $filename"
    emacs_vterm_cmd find-file "$filename"
end
