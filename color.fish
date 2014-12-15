set -l base03  "--bold black"
set -l base02  "black"
set -l base01  "--bold green"
set -l base00  "--bold yellow"
set -l base0   "--bold blue"
set -l base1   "--bold cyan"
set -l base2   "white"
set -l base3   "--bold white"
set -l yellow  "yellow"
set -l orange  "--bold red"
set -l red     "red"
set -l magenta "magenta"
set -l violet  "--bold magenta"
set -l blue    "blue"
set -l cyan    "cyan"
set -l green   "green"

set fish_color_autosuggestion d0d0d0
set fish_color_command 005fd7\x1epurple
set fish_color_comment red
set fish_color_cwd 1c1c1c
set fish_color_cwd_root red
set fish_color_error 870000\x1e\x2d\x2dbold
set fish_color_escape 87afff
set fish_color_history_current 5f5fff
set fish_color_host \x2do\x1ecyan
set fish_color_match 5f5fff
set fish_color_normal 000000
set fish_color_operator 5f5fff
set fish_color_param 000000
set fish_color_quote brown
set fish_color_redirection normal
set fish_color_search_match \x2d\x2dbackground\x3dpurple
set fish_color_status red
set fish_color_user \x2do\x1egreen
set fish_color_valid_path \x2d\x2dunderline
set fish_pager_color_completion normal
set fish_pager_color_description 555\x1eyellow
set fish_pager_color_prefix cyan
set fish_pager_color_progress cyan

if test "$TERM" = "linux"
    echo -en "\e]PB839496" # S_base00
    echo -en "\e]PA93a1a1" # S_base01
    echo -en "\e]P0eee8d5" # S_base02
    echo -en "\e]P62aa198" # S_cyan
    echo -en "\e]P8fdf6e3" # S_base03
    echo -en "\e]P2859900" # S_green
    echo -en "\e]P5d33682" # S_magenta
    echo -en "\e]P1dc322f" # S_red
    echo -en "\e]PC657b83" # S_base0
    echo -en "\e]PE586e75" # S_base1
    echo -en "\e]P9cb4b16" # S_orange
    echo -en "\e]P7073642" # S_base2
    echo -en "\e]P4268bd2" # S_blue
    echo -en "\e]P3b58900" # S_yellow
    echo -en "\e]PF002b36" # S_base3
    echo -en "\e]PD6c71c4" # S_violet
    clear # against bg artifacts
end

