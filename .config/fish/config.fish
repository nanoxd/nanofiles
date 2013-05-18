# Set the path
set PATH $PATH /usr/local/bin

# Globally recognized variables
set -g -x VISUAL vim
set -g -x EDITOR vim
set -g -x PAGER less


## Functions ##

# Fish config editing #
function ef; vim ~/.config/fish/config.fish; end
function rf; . ~/.config/fish/config.fish; end

# Directories traversal
function ..; cd ..; end
function ...; cd ../..; end
function ....; cd ../../..; end
function md; mkdir -p $argv; end

# Git
function g;   git $argv; end
function gs;  git status $argv; end
function gd;  git diff $argv; end
function ga;  git add $argv; end
function ga.; git add . $argv; end
function go;  git checkout $argv; end
function gonew; git checkout -b $argv; end
function gc;  git commit -v $argv; end
function gca; git commit -v --amend $argv; end
function gp;  git pull $argv; end
function gpr; git pull --rebase $argv; end
function gb;  git branch $argv; end
function gri; git rebase --interactive $argv; end

# Tmux
function ta; tmux attach $argv; end
