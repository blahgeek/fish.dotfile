set -g solarized_base03  "--bold black"
set -g solarized_base02  "black"
set -g solarized_base01  "--bold green"
set -g solarized_base00  "--bold yellow"
set -g solarized_base0   "--bold blue"
set -g solarized_base1   "--bold cyan"
set -g solarized_base2   "white"
set -g solarized_base3   "--bold white"
set -g solarized_yellow  "yellow"
set -g solarized_orange  "--bold red"
set -g solarized_red     "red"
set -g solarized_magenta "magenta"
set -g solarized_violet  "--bold magenta"
set -g solarized_blue    "blue"
set -g solarized_cyan    "cyan"
set -g solarized_green   "green"

# Used by fish's completion; see
# http://fishshell.com/docs/2.0/index.html#variables-color

set -g fish_color_normal      $solarized_base01
set -g fish_color_command     $solarized_blue
set -g fish_color_quote       $solarized_cyan
set -g fish_color_redirection $solarized_green
set -g fish_color_end         $solarized_base1
set -g fish_color_error       $solarized_red
set -g fish_color_param       $solarized_base01
set -g fish_color_comment     $solarized_base1
set -g fish_color_match       $solarized_cyan
set -g fish_color_search_match "--background=$solarized_base2"
set -g fish_color_operator    $solarized_orange
set -g fish_color_escape      $solarized_cyan
set -g fish_color_autosuggestion $solarized_base1

# Used by fish_prompt

set -g fish_color_hostname    $solarized_cyan
set -g fish_color_cwd         $solarized_yellow
set -g fish_color_git         $solarized_green
set -g fish_color_ssh         $solarized_red

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

