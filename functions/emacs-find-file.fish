function emacs-find-file -d "Find file inside emacs"
    set -l filename $argv[1]

    if test -e $filename
        set filename (realpath $filename)
    end

    echo "Finding file $filename"
    emacs_vterm_cmd find-file "$filename"
end
