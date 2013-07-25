## General ##

# Set homebrew path
set PATH /usr/local/bin $PATH
# Set Postgres.app path
set PATH /Applications/Postgres.app/Contents/MacOS/bin $PATH
# Set Python path
set PATH /usr/local/share/python $PATH
# Set Heroku Toolbelt
set PATH /usr/local/heroku/bin $PATH
# Set Node.js path
set PATH /usr/local/share/npm/bin $PATH
# Set Elixir path
set PATH /usr/local/bin/elixir/bin $PATH

# Globally recognized variables
set -g -x VISUAL vim
set -g -x EDITOR vim
set -g -x PAGER less

## Program options ##

# Link Homebrew casks in `/Applications` rather than `~/Applications`
set -g -x HOMEBREW_CASK_OPTS "--appdir=/Applications"
set -g -x DISABLE_AUTO_TITLE true

## Functions ##

# Directories traversal
function ..; cd ..; end
function ...; cd ../..; end
function ....; cd ../../..; end

function gcb
  git create-branch $argv
end
