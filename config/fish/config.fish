# Set paths
set -U fish_user_paths /usr/local/sbin /usr/local/bin /usr/local/share/npm/bin /usr/local/share/python ~/bin ~/.tmuxifier/bin $GOPATH/bin

# Load Solarized for colors
. $HOME/.config/fish/solarized.fish

# Editors
set -U EDITOR vim
set -U VISUAL vim
set -U PAGER less

# ENVs
set -x GOPATH "$HOME/Developer/Code/go"
set -x HOMEBREW_CASK_OPTS "--appdir=/Applications" # Install location
set -x TMUXIFIER_LAYOUT_PATH "$HOME/.tmux-layouts"

fish_user_abbreviations

# Source Chruby
. /usr/local/share/chruby/chruby.fish
. /usr/local/share/chruby/auto.fish

if test -f $HOME/.fish
  . $HOME/.fish
end
