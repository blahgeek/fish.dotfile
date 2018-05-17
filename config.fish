if test -f /usr/local/share/autojump/autojump.fish
    source /usr/local/share/autojump/autojump.fish
else
    if test -f /usr/share/autojump/autojump.fish
        source /usr/share/autojump/autojump.fish
    end
end

source ~/.config/fish/color.fish

set -g __fish_git_prompt_show_informative_status 1
set -g ___fish_git_prompt_char_cleanstate "="
set -g ___fish_git_prompt_char_dirtystate "+"
set -g ___fish_git_prompt_char_invalidstate "×"
set -g ___fish_git_prompt_char_stagedstate "∙"

abbr vi="nvim"
abbr vim="nvim"
abbr du="du -h"
abbr df="df -h"
abbr x="dtrx -r -n"
abbr ll="ls -alh"
alias xclip="xclip -selection clipboard -r"
alias mypasswd="python2 ~/Documents/projects/mypasswd/mypasswd.py"
alias pandoc="pandoc --latex-engine=xelatex --template=/Users/BlahGeek/.local/share/pandoc/pm-template.latex"

set -x GOPATH "$HOME/.golang"
function gopath_here --description "Append (pwd) to GOPATH"
    set -x GOPATH "$HOME/.golang":(pwd)
    echo "GOPATH: " "$GOPATH"
end

function _prepend_path --description "Prepend directory to PATH if valid"
    set dir $argv[1]
    if test -d $dir
        set -x PATH $dir $PATH
    end
end

set -x EDITOR nvim
set -x PARALLEL_SHELL /bin/sh
set -x MANPAGER "nvim -c 'set ft=man' -"

_prepend_path ~/.npm/bin
_prepend_path $GOPATH/bin
_prepend_path /opt/local/bin
_prepend_path ~/.local/bin
_prepend_path ~/Library/Python/2.7/bin
_prepend_path ~/Library/Python/3.6/bin

function mkcd
    mkdir $argv; and cd $argv
end

function vf
    if python -m virtualfish > /dev/null ^/dev/null
        eval (python -m virtualfish auto_activation global_requirements)
        echo "Virtualfish just initialized, pls re-run this command"
    else
        echo "Virtualfish not found"
    end
end
