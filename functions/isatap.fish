#!/usr/local/bin/fish
function isatap

    set REMOTE_IP 166.111.21.1
    set LINK_PREFIX "fe80::200:5efe"
    set GLOBAL_PREFIX "2402:f000:1:1501:200:5efe"

    if sudo ifconfig gif0 destroy
        echo "Previous gif0 destroyed"
    end

    set LOCAL_IP (sudo ifconfig en0 | grep inet | grep -v inet6 | awk '{print $2}')
    if test (count $argv) = 0
        set PUBLIC_IP (curl ifconfig.me)
    else 
        if test $argv = public
            set PUBLIC_IP $LOCAL_IP
        else
            set PUBLIC_IP $argv
        end
    end

    echo "Public IP: $PUBLIC_IP, Local IP: $LOCAL_IP"

    sudo ifconfig gif0 create
    sudo ifconfig gif0 tunnel $LOCAL_IP $REMOTE_IP
    sudo ifconfig gif0 inet6 $LINK_PREFIX:$PUBLIC_IP prefixlen 64
    sudo ifconfig gif0 inet6 $GLOBAL_PREFIX:$PUBLIC_IP prefixlen 64

    sudo route delete -inet6 default
    sudo route add -inet6 default $GLOBAL_PREFIX:$REMOTE_IP

    echo "Done"
end
