function fish_greeting --description 'Fish greeting~'
    if type archey3 > /dev/null 2> /dev/null
        archey3
        return
    end
    if type archey > /dev/null 2> /dev/null
        archey
        return
    end
    echo
    if type uname > /dev/null 2> /dev/null
        echo "Machine:  " (uname -prs)
    end
    if type date > /dev/null 2> /dev/null
        echo "Date:     " (date)
    end
    if type uptime > /dev/null 2> /dev/null
        echo "Uptime:   " (uptime)
    end
    if type df > /dev/null 2> /dev/null
        echo
        df -hl | grep --color=never "2> /dev/" | grep -v "/snap"
    end
    if type fortune >/dev/null 2> /dev/null
        echo
        fortune -a -s
        echo
    end
end
