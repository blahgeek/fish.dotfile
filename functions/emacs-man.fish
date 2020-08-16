function emacs-man -d "Open manpage inside emacs" --wraps man
    emacs-vterm-cmd man "$argv"
end
