# set -l base03  --bold black
# set -l base02  black
# set -l base01  brgreen
# set -l base00  bryellow
# set -l base0   brblue
# set -l base1   brcyan
# set -l base2   white
# set -l base3   --bold white
# set -l yellow  yellow
# set -l orange  brred
# set -l red     red
# set -l magenta magenta
# set -l violet  brmagenta
# set -l blue    blue
# set -l cyan    cyan
# set -l green   green

# set -g solarized_background_highlight (set_color --background=white)

# true color
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

set -g fish_color_normal      $base0
set -g fish_color_command     $blue
set -g fish_color_quote       $cyan
set -g fish_color_redirection $base0
set -g fish_color_end         $base0
set -g fish_color_error       $red
set -g fish_color_param       $base0
set -g fish_color_comment     $base01
set -g fish_color_match       $cyan
set -g fish_color_search_match "--background=$base2"
set -g fish_color_operator    $orange
set -g fish_color_escape      $cyan
set -g fish_color_autosuggestion $base01

# Used by fish_prompt

set -g fish_color_hostname    $cyan
set -g fish_color_cwd         $yellow
set -g fish_color_git         $green
set -g fish_color_ssh         $red
set -g fish_color_venv        $blue
set -g fish_color_jobs        $blue

