# Copied from default implementation
# modified to use with emacs vterm
function fish_title
    # emacs (except vterm) cannot handle this
    if test "$INSIDE_EMACS" = "vterm" -o -z "$INSIDE_EMACS"
        echo (status current-command) (prompt_pwd)
    end
end
