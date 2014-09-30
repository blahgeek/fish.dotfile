#!/usr/local/bin/fish
function gitignore
    curl -4 -s https://www.gitignore.io/api/$argv
end
