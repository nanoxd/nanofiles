# Set paths
set fish_user_paths /usr/local/sbin /usr/local/bin /usr/local/share/npm/bin /usr/local/share/python ~/bin

# Load Solarized for colors
. $HOME/.config/fish/solarized.fish

# Editors
set -x EDITOR 'vim'
set -x VISUAL 'vim'
set -x PAGER 'less'

# ENVs
set -x GOPATH "$HOME/Developer/Code/go"
set -x HOMEBREW_CASK_OPTS "--appdir=/Applications" # Install location
set -x VAGRANT_HOME /Volumes/LaCie/vagrant
set -x VAGRANT_VMWARE_CLONE_DIRECTORY /Volumes/LaCie/vagrant/vmware_clone_dir
