# On Vim (not neovim) terminal mode
if test -n "$VIM_TERMINAL"
    set -e -x VIM_TERMINAL
    set -e -x VIM_SERVERNAME
    set -e -x VIMRUNTIME
    set -e -x VIM
    set -e -x MYVIMRC
    set -e -x NVIM_LISTEN_ADDRESS
end

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

set -x GOPATH "$HOME/Code/GO"
function gopath_here --description "Append (pwd) to GOPATH"
    set -x GOPATH "$HOME/Code/GO":(pwd)
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
_prepend_path /opt/local/sbin
_prepend_path /usr/local/bin
_prepend_path /usr/local/sbin
_prepend_path ~/.local/bin
_prepend_path ~/Library/Python/2.7/bin
_prepend_path ~/Library/Python/3.6/bin

function mkcd
    mkdir $argv; and cd $argv
end

# virtualfish
eval (python -m virtualfish auto_activation global_requirements)
