function fish_prompt --description 'Write out the prompt'
	
	set -l last_status $status

	set -l prompt_status
	if test $last_status -ne 0
		if not set -q __fish_prompt_status
			set -g __fish_prompt_status (set_color $fish_color_error)
		end
		set prompt_status "$__fish_prompt_status [$last_status]"
	end

	# Just calculate these once, to save a few cycles when displaying the prompt
	if not set -q __fish_prompt_hostname
		set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
	end

    if set -q SSH_CONNECTION
        echo -n -s (set_color $fish_color_ssh) "[SSH]" (set_color $fish_color_normal) " "
    end
	
	if set -q VIRTUAL_ENV
		echo -n -s (set_color -b blue white) "(" (basename "$VIRTUAL_ENV") ")" (set_color $fish_color_normal) " "
	end

    echo -n -s (set_color $fish_color_hostname) "$__fish_prompt_hostname" ' '
    echo -n -s (set_color $fish_color_cwd) (prompt_pwd)
    echo -n -s (set_color $fish_color_git) (__fish_git_prompt)
    echo -n -s "$prompt_status"
    echo -n -s (set_color $fish_color_normal) "> "
end
