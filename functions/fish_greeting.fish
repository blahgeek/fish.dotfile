function fish_greeting --description 'Fish greeting~'
    if type archey3 > /dev/null ^/dev/null
        archey3
        return
    end
    if type archey > /dev/null ^/dev/null
        archey
        return
    end
    echo
    if type uname > /dev/null ^/dev/null
        echo "Machine:  " (uname -prs)
    end
    if type date > /dev/null ^/dev/null
        echo "Date:     " (date)
    end
    if type uptime > /dev/null ^/dev/null
        echo "Uptime:   " (uptime)
    end
    if type df > /dev/null ^/dev/null
        echo
        df -hl | grep --color=never "^/dev/" | grep -v "/snap"
    end
    if type fortune >/dev/null ^/dev/null
        echo
        fortune -a -s
        echo
    end
end
