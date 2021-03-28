# From https://github.com/magicmonty/bash-git-prompt 2.7.1
# However, the original fish_prompt.fish uses gitstatus.py, which is slower than gitstatus.sh
# I modified it to use gitstatus.sh (in /bin directory)

function fish_git_prompt_fast
    # Colors
    # Reset
    set ResetColor (set_color normal)       # Text Reset

    # Regular Colors
    set Red (set_color red)                 # Red
    set Yellow (set_color yellow);          # Yellow
    set Blue (set_color blue)               # Blue
    set WHITE (set_color white)

    # Bold
    set BGreen (set_color -o green)         # Green

    # High Intensty
    set IBlack (set_color -o black)         # Black

    # Bold High Intensty
    set Magenta (set_color -o purple)       # Purple

    # Default values for the appearance of the prompt. Configure at will.
    set GIT_PROMPT_PREFIX "("
    set GIT_PROMPT_SUFFIX ")"
    set GIT_PROMPT_AHEAD "↑"
    set GIT_PROMPT_BEHIND "↓"
    set GIT_PROMPT_SEPARATOR "|"
    set GIT_PROMPT_BRANCH "$Magenta"
    set GIT_PROMPT_STAGED "$Red●"
    set GIT_PROMPT_CONFLICTS "$Red✖"
    set GIT_PROMPT_CHANGED "$Blue✚"
    set GIT_PROMPT_REMOTE ""
    set GIT_PROMPT_UNTRACKED "…"
    set GIT_PROMPT_STASHED "⚑"
    set GIT_PROMPT_CLEAN "$BGreen✔"

    # this would make gitstatus.sh faster (default=all)
    set -x __GIT_PROMPT_SHOW_UNTRACKED_FILES normal
    set _GIT_STATUS (gitstatus.sh 2> /dev/null)
    set __CURRENT_GIT_STATUS $_GIT_STATUS

    set __CURRENT_GIT_STATUS_PARAM_COUNT (count $__CURRENT_GIT_STATUS)

    if not test "0" -eq $__CURRENT_GIT_STATUS_PARAM_COUNT
        set GIT_BRANCH $__CURRENT_GIT_STATUS[1]
        # change yikai_branch_name to branch_name. for pony
        # TODO: {$USER} does not work here
        set GIT_BRANCH (string replace -r "^yikai_" "" "$GIT_BRANCH")

        set GIT_REMOTE "$__CURRENT_GIT_STATUS[2]"
        if contains "." "$GIT_REMOTE"; or contains "_NO_REMOTE_TRACKING_" "$GIT_REMOTE"
            set -e GIT_REMOTE
        else
            set GIT_REMOTE (string replace _AHEAD_ "$GIT_PROMPT_AHEAD" "$GIT_REMOTE")
            set GIT_REMOTE (string replace _BEHIND_ "$GIT_PROMPT_BEHIND" "$GIT_REMOTE")
        end
        set GIT_UPSTREAM $__CURRENT_GIT_STATUS[3]

        set GIT_STAGED $__CURRENT_GIT_STATUS[4]
        set GIT_CONFLICTS $__CURRENT_GIT_STATUS[5]
        set GIT_CHANGED $__CURRENT_GIT_STATUS[6]
        set GIT_UNTRACKED $__CURRENT_GIT_STATUS[7]
        set GIT_STASHED $__CURRENT_GIT_STATUS[8]
        set GIT_CLEAN $__CURRENT_GIT_STATUS[9]
    end

    if test -n "$__CURRENT_GIT_STATUS"
        set STATUS " $GIT_PROMPT_PREFIX$GIT_PROMPT_BRANCH$GIT_BRANCH$ResetColor"

        if set -q GIT_REMOTE
            set STATUS "$STATUS$GIT_PROMPT_REMOTE$GIT_REMOTE$ResetColor"
        end

        set STATUS "$STATUS$GIT_PROMPT_SEPARATOR"

        if [ $GIT_STAGED != "0" ]
            set STATUS "$STATUS$GIT_PROMPT_STAGED$GIT_STAGED$ResetColor"
        end

        if [ $GIT_CONFLICTS != "0" ]
            set STATUS "$STATUS$GIT_PROMPT_CONFLICTS$GIT_CONFLICTS$ResetColor"
        end

        if [ $GIT_CHANGED != "0" ]
            set STATUS "$STATUS$GIT_PROMPT_CHANGED$GIT_CHANGED$ResetColor"
        end

        if [ "$GIT_UNTRACKED" != "0" ]
            set STATUS "$STATUS$GIT_PROMPT_UNTRACKED$GIT_UNTRACKED$ResetColor"
        end

        if [ "$GIT_STASHED" != "0" ]
            set STATUS "$STATUS$GIT_PROMPT_STASHED$GIT_STASHED$ResetColor"
        end

        if [ "$GIT_CLEAN" = "1" ]
            set STATUS "$STATUS$GIT_PROMPT_CLEAN"
        end

        set STATUS "$STATUS$ResetColor$GIT_PROMPT_SUFFIX"

        echo -en "$STATUS"
    end
end
