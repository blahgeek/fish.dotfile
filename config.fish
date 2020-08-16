# On Vim (not neovim) terminal mode
if test -n "$VIM_TERMINAL"
    set -e VIM_TERMINAL
    set -e VIM_SERVERNAME
    set -e VIMRUNTIME
    set -e VIM
    set -e MYVIMRC
    set -e NVIM_LISTEN_ADDRESS
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

if test "$INSIDE_EMACS" = "vterm"
    abbr -g vi emacs-find-file
    abbr -g vim emacs-find-file
    abbr -g man emacs-man
else
    abbr -g vi "nvim"
    abbr -g vim "nvim"
end
abbr du "du -h"
abbr df "df -h"
abbr x "dtrx -r -n"
abbr ll "ls -alh"
abbr sxiv "sxiv -a"  # autoplay gif
if type -q xclip
    abbr pbpaste "xclip -selection clipboard -o"
    abbr pbcopy "xclip -selection clipboard"
end

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
if not set -q INSIDE_EMACS
    set -x MANPAGER "nvim -c 'set ft=man' -"
else
    set -e MANPAGER
end

_prepend_path ~/.npm/bin
_prepend_path $GOPATH/bin
_prepend_path /opt/local/bin
_prepend_path /opt/local/sbin
_prepend_path /usr/local/bin
_prepend_path /usr/local/sbin
_prepend_path ~/Library/Android/sdk/platform-tools
_prepend_path ~/Library/Android/sdk/ndk-bundle
_prepend_path /usr/local/opt/ruby/bin
_prepend_path ~/.local/bin
_prepend_path ~/.config/fish/bin

# fzf
set -x FZF_CTRL_T_COMMAND 'fd --type file "" (realpath --relative-to=. (git rev-parse --show-toplevel 2> /dev/null || echo .))'
set -x FZF_DEFAULT_COMMAND "$FZF_CTRL_T_COMMAND"

function mkcd
    mkdir $argv; and cd $argv
end

# virtualfish
eval (python -m virtualfish auto_activation global_requirements)
test -e /usr/libexec/java_home; and setjdk 1.8

# GPG
if type -q gpgconf
    gpgconf --launch gpg-agent
    set -gx SSH_AUTH_SOCK "$HOME/.gnupg/S.gpg-agent.ssh"
end

if test "$TERM_PROGRAM" = "iTerm.app"
    test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
end
