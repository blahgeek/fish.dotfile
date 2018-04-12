function fish_konsole_update
    fish_sunwait_update
    set -l konsole_profiles "Font=Fira Mono"

    if test "$SUNWAIT_STATUS" = "DAY"
        set konsole_profiles "$konsole_profiles;ColorScheme=SolarizedLight"
    else
        set konsole_profiles "$konsole_profiles;ColorScheme=Solarized"
    end

    printf "\033]50;%s\a" "$konsole_profiles"
end

