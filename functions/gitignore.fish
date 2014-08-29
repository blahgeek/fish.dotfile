#!/usr/local/bin/fish
function gitignore
    curl -s http://www.gitignore.io/api/$argv
end
