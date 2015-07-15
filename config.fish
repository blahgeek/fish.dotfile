if test -f /usr/local/share/autojump/autojump.fish
    . /usr/local/share/autojump/autojump.fish
else
    if test -f /etc/profile.d/autojump.fish
        . /etc/profile.d/autojump.fish
    end
end
. ~/.config/fish/virtualfish/virtual.fish
. ~/.config/fish/virtualfish/auto_activation.fish
. ~/.config/fish/virtualfish/global_requirements.fish

. ~/.config/fish/color.fish

set -g __fish_git_prompt_show_informative_status 1
set -g ___fish_git_prompt_char_cleanstate "✓"
set -g ___fish_git_prompt_char_dirtystate "+"
set -g ___fish_git_prompt_char_invalidstate "×"
set -g ___fish_git_prompt_char_stagedstate "∙"

alias vi="vim"
alias du="du -h"
alias df="df -h"
alias x="dtrx -r -n"
alias net_class="~/Documents/projects/net_class/net_class.py --path ~/Documents/网络学堂 --size_limit 10000000"
alias mypasswd="python2 /Users/BlahGeek/Documents/projects/mypasswd/mypasswd.py"
alias pandoc="pandoc --latex-engine=xelatex -V mainfont=SimSun --template=/Users/BlahGeek/.local/share/pandoc/pm-template.latex"
alias mtr="mtr -t"
alias ll="ls -alh"
alias yoink="open -a Yoink"

set -x GOPATH "$HOME/.golang"

set -x EDITOR vim
set -x PATH ~/.local/bin /usr/local/bin /usr/local/sbin $GOPATH/bin $PATH

function mkcd
    mkdir $argv; and cd $argv
end

source ~/.config/fish/.iterm2_shell_integration.fish
