function fish_greeting --description 'Fish greeting~'
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
        df -h | grep --color=never "^/dev/"
    end
    if type fortune >/dev/null ^/dev/null
        echo
        fortune -a -s
        echo
    end
end
