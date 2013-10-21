. ~/.config/fish/autojump.fish

alias vi="vim"
alias du="du -h"
alias df="df -h"
alias x="dtrx -r -n"
alias net_class="~/Documents/projects/net_class/net_class.py --path ~/Documents/netclass --size_limit 10000000"
alias oclip="xsel -b"
alias 2clip="xsel -ib"
alias pandoc="pandoc --latex-engine=xelatex -V mainfont=SimSun"
alias mplayer-pitch="mplayer -af scaletempo=speed=pitch"
alias mtr="mtr -t"
alias ll="ls -alh"

set -x EDITOR vim
set -x PATH ~/.local/bin /usr/local/bin /usr/local/sbin $PATH

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

set fish_greeting \n "    / \__         Here goes the "(set_color blue)"Fish"(set_color normal)\n"    (    @\___   / "\n"   /         O   "\n"  /   (_____/    "\n" /_____/   U     "\n \n
