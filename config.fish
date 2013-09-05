alias vi="vim"
alias du="du -h"
alias df="df -h"
alias free="free -h"
alias x="dtrx -r -n"
alias oclip="xsel -b"
alias 2clip="xsel -ib"
alias mtr="mtr -t"
alias ll="ls -alh"

set -x EDITOR vim
set -x PATH $PATH ~/.local/bin

function mkcd
    mkdir $argv; and cd $argv
end

set fish_greeting \n "    / \__         Here goes the "(set_color blue)"Fish"(set_color normal)\n"    (    @\___   / "\n"   /         O   "\n"  /   (_____/    "\n" /_____/   U     "\n \n
