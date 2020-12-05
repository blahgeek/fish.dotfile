#!/usr/local/bin/fish
function gitignore
    curl -4 -L -s https://www.gitignore.io/api/$argv
end
