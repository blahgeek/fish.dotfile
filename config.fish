. ~/.config/fish/autojump.fish
. ~/.config/fish/virtualfish/virtual.fish
. ~/.config/fish/virtualfish/auto_activation.fish
. ~/.config/fish/virtualfish/global_requirements.fish

. ~/.config/fish/color.fish

alias vi="vim"
alias du="du -h"
alias df="df -h"
alias x="dtrx -r -n"
alias net_class="~/Documents/projects/net_class/net_class.py --path ~/Documents/网络学堂 --size_limit 10000000"
alias mypasswd="python2 /Users/BlahGeek/Documents/projects/mypasswd/mypasswd.py"
alias pandoc="pandoc --latex-engine=xelatex -V mainfont=SimSun"
alias mtr="mtr -t"
alias ll="ls -alh"
alias yoink="open -a Yoink"

set -x EDITOR vim
set -x PATH ~/.local/bin /usr/local/bin /usr/local/sbin $PATH

set -x PIP_USE_WHEEL "true"
set -x PIP_WHEEL_DIR "$HOME/.pip/wheels"
set -x PIP_FIND_LINKS "$HOME/.pip/wheels"
set -x PIP_DOWNLOAD_CACHE "$HOME/.pip/cache"

function mkcd
    mkdir $argv; and cd $argv
end

function mkproject
    cd /Users/BlahGeek/Documents/projects
    if test -d $argv[1]
        echo "Dir exists"
        return
    end
    mkcd $argv
    and git init
    and git remote add server "ssh://node0.blahgeek.com/home/blahgeek/projects.git/$argv[1].git"
    and echo "init done, creating dir on remote"
    and ssh node0.blahgeek.com "git init --bare /home/blahgeek/projects.git/$argv[1].git"
end

#if test $TERM != "screen"
#    exec tmux
#end

#set fish_greeting \n "    / \__         Here goes the "(set_color blue)"Fish"(set_color normal)\n"    (    @\___   / "\n"   /         O   "\n"  /   (_____/    "\n" /_____/   U     "\n \n
