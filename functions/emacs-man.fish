function emacs-man -d "Open manpage inside emacs" --wraps man
    emacs-vterm-cmd man "$argv"  # pass single argument like man "1 man"
end
