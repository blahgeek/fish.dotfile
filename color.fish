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

# Used by fish's completion; see
# http://fishshell.com/docs/2.0/index.html#variables-color

set -g fish_color_normal      $base0
set -g fish_color_command     $blue
set -g fish_color_quote       $cyan
set -g fish_color_redirection $green
set -g fish_color_end         $base0
set -g fish_color_error       $red
set -g fish_color_param       $base0
set -g fish_color_comment     $base01
set -g fish_color_match       $cyan
set -g fish_color_search_match "--background=$base02"
set -g fish_color_operator    $orange
set -g fish_color_escape      $cyan

# Used by fish_prompt

set -g fish_color_hostname    $cyan
set -g fish_color_cwd         $yellow
set -g fish_color_git         $green
set -g fish_color_ssh         $red

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

