function emacs-find-file -d "Find file inside emacs"
    set -l filename "$argv[1]"
    if not string match '/*' "$argv[1]" > /dev/null 2>&1
        set filename (realpath "$argv[1]")
    end

    echo "Finding file $filename"
    emacs-vterm-cmd find-file "$filename"
end
