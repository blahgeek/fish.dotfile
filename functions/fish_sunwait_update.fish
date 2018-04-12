function fish_sunwait_update
    # default to beijing
    set -l latitude "40N"
    set -l longitude "116E"

    set -q SUNWAIT_LATITUDE; and set -l latitude "$SUNWAIT_LATITUDE"
    set -q SUNWAIT_LONGITUDE; and set -l longitude "$SUNWAIT_LONGITUDE"

    set -e SUNWAIT_STATUS
    if set -q SUNWAIT_OVERRIDE
        set -x -g SUNWAIT_STATUS "$SUNWAIT_OVERRIDE"
        return
    end

    type sunwait > /dev/null ^/dev/null; or return
    set -x -g SUNWAIT_STATUS (sunwait poll "$latitude" "$longitude")
    true  # ignore return code of sunwait
end

