. ~/.config/fish/autojump.fish

alias vi="vim"
alias du="du -h"
alias df="df -h"
alias free="free -h"
alias x="dtrx -r -n"
alias net_class="net_class --path /home/blahgeek/Documents/netclass --size_limit 10000000"
alias off="sudo halt -p"
alias reboot="sudo reboot"
alias oclip="xsel -b"
alias 2clip="xsel -ib"
alias net9bss="luit -encoding gbk -- ssh -1 bbs.net9.org"
alias pandoc="pandoc --latex-engine=xelatex -V mainfont=FZSongS\-Extended --template=/home/blahgeek/.pandoc/template.tex"
alias mplayer-pitch="mplayer -af scaletempo=speed=pitch"
alias pdf_merge="gs -dNOPAUSE -sDEVICE=pdfwrite -sOUTPUTFILE=out.pdf -dBATCH"
alias mtr="mtr -t"
alias ll="ls -alh"
alias play="play2"

set -x EDITOR vim
set -x PATH $PATH ~/.local/bin

function mkcd
    mkdir $argv; and cd $argv
end

function mkproject
    cd /home/blahgeek/Documents/projects
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

if test $TERM = "xterm"
    exec tmux
end

set fish_greeting \n "    / \__         Here goes the "(set_color blue)"Fish"(set_color normal)\n"    (    @\___   / "\n"   /         O   "\n"  /   (_____/    "\n" /_____/   U     "\n \n
