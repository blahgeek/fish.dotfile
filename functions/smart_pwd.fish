function smart_pwd --description 'Customized version of prompt_pwd, print full path for dirs ends with digits'
    set realhome ~
    set -l tmp (string replace -r '^'"$realhome"'($|/)' '~$1' $PWD)

    string replace -ar '(\.?[^/_]{1})[^/]*[^0-9]/' '$1/' $tmp
end
