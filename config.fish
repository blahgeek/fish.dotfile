if test -f /usr/local/share/autojump/autojump.fish
    source /usr/local/share/autojump/autojump.fish
else
    if test -f /etc/profile.d/autojump.fish
        source /etc/profile.d/autojump.fish
    end
end

source ~/.config/fish/color.fish
source ~/.config/fish/iterm2_integration.fish

set -g __fish_git_prompt_show_informative_status 1
set -g ___fish_git_prompt_char_cleanstate "✓"
set -g ___fish_git_prompt_char_dirtystate "+"
set -g ___fish_git_prompt_char_invalidstate "×"
set -g ___fish_git_prompt_char_stagedstate "∙"

if test (echo $FISH_VERSION | sed 's/\.//g' | sed 's/-.*//g' ) -lt 220
    if test -t 0
        echo 'Warning: fish version < 2.2.0, using alias instead of abbr'
    end
    alias abbr=alias
end

abbr vi="vim"
abbr du="du -h"
abbr df="df -h"
abbr x="dtrx -r -n"
abbr mtr="mtr -t"
abbr ll="ls -alh"
alias yoink="open -a Yoink"
alias lb="open -a launchBar"
alias net_class="~/Documents/projects/net_class/net_class.py --path ~/Documents/网络学堂 --size_limit 50000000"
alias mypasswd="python2 /Users/BlahGeek/Documents/projects/mypasswd/mypasswd.py"
alias pandoc="pandoc --latex-engine=xelatex --template=/Users/BlahGeek/.local/share/pandoc/pm-template.latex"

set -x GOPATH "$HOME/.golang"
function gopath_here --description "Append (pwd) to GOPATH"
    set -x GOPATH "$HOME/.golang":(pwd)
    echo "GOPATH: " "$GOPATH"
end

set -x EDITOR vim
set -x PATH ~/.local/bin /usr/local/bin /usr/local/sbin $GOPATH/bin $PATH

function mkcd
    mkdir $argv; and cd $argv
end

if python2 -m virtualfish > /dev/null ^/dev/null
    eval (python2 -m virtualfish auto_activation global_requirements)
end
