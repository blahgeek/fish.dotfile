# set -g solarized_base03  (set_color --bold black)
# set -g solarized_base02  (set_color black)
# set -g solarized_base01  (set_color --bold green)
# set -g solarized_base00  (set_color --bold yellow)
# set -g solarized_base0   (set_color --bold blue)
# set -g solarized_base1   (set_color --bold cyan)
# set -g solarized_base2   (set_color white)
# set -g solarized_base3   (set_color --bold white)
# set -g solarized_yellow  (set_color yellow)
# set -g solarized_orange  (set_color --bold red)
# set -g solarized_red     (set_color red)
# set -g solarized_magenta (set_color magenta)
# set -g solarized_violet  (set_color --bold magenta)
# set -g solarized_blue    (set_color blue)
# set -g solarized_cyan    (set_color cyan)
# set -g solarized_green   (set_color green)

# set -g solarized_background_highlight (set_color --background=white)

set -l base03  002b36
set -l base02  073642
set -l base01  586e75
set -l base00  657b83
set -l base0   839496
set -l base1   93a1a1
set -l base2   eee8d5
set -l base3   fdf6e3
set -l yellow  b58900
set -l orange  cb4b16
set -l red     dc322f
set -l magenta d33682
set -l violet  6c71c4
set -l blue    268bd2
set -l cyan    2aa198
set -l green   859900

# Used by fish's completion; see
# http://fishshell.com/docs/2.0/index.html#variables-color

set -g fish_color_normal      $base01
set -g fish_color_command     $blue
set -g fish_color_quote       $cyan
set -g fish_color_redirection $green
set -g fish_color_end         $base00
set -g fish_color_error       $red
set -g fish_color_param       $base02
set -g fish_color_comment     $base1
set -g fish_color_match       $cyan
set -g fish_color_search_match "--background=$base2"
set -g fish_color_operator    $orange
set -g fish_color_escape      $cyan
set -g fish_color_autosuggestion $base1

# Used by fish_prompt

set -g fish_color_hostname    $cyan
set -g fish_color_cwd         $yellow
set -g fish_color_git         $green
set -g fish_color_ssh         $red
set -g fish_color_venv        $blue

if test "$TERM" = "linux"
    echo -en "\e]PB002b36" # S_base00
    echo -en "\e]PA073642" # S_base01
    echo -en "\e]P0586e75" # S_base02
    echo -en "\e]P6657b83" # S_cyan
    echo -en "\e]P8839496" # S_base03
    echo -en "\e]P293a1a1" # S_green
    echo -en "\e]P5eee8d5" # S_magenta
    echo -en "\e]P1fdf6e3" # S_red
    echo -en "\e]PCb58900" # S_base0
    echo -en "\e]PEcb4b16" # S_base1
    echo -en "\e]P9dc322f" # S_orange
    echo -en "\e]P7d33682" # S_base2
    echo -en "\e]P46c71c4" # S_blue
    echo -en "\e]P3268bd2" # S_yellow
    echo -en "\e]PF2aa198" # S_base3
    echo -en "\e]PD859900" # S_violet
    clear # against bg artifacts
end

