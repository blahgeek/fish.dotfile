function fish_user_key_bindings
    if test -e /usr/local/opt/fzf/shell/key-bindings.fish
        source /usr/local/opt/fzf/shell/key-bindings.fish
    end
    if functions --query fzf_key_bindings > /dev/null
        fzf_key_bindings
    end
end
