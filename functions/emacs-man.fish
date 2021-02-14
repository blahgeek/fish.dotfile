function emacs-man -d "Open manpage inside emacs" --wraps man
    emacs_vterm_cmd man "$argv"  # pass single argument like man "1 man"
end
