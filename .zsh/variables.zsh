## Path variables ##
export PATH=/usr/local/bin:/usr/bin:/usr/local/share/python:/bin:/usr/sbin:/sbin:
export PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH" # Add Postgres.app to Path
export PATH=$PATH:$HOME/.rvm/bin # RVM to PATH for scripting
export GOPATH=$HOME/Developer/Code/go # Google Go Path
export PATH=/usr/local/share/npm/bin:$PATH # # NPM

## System ##
export EDITOR='vim'
export LANG="en_US"
export LC_ALL="en_US.UTF-8"
export TERM=xterm-256color
export LESS='-i -r'
export PAGER='less'
export GREP_OPTIONS='--color=auto'



## History ##
export HISTIGNORE="ls:ll:la:l:clear:cd:cd -:pwd:exit:date:* --help" # Make some commands not show up in history
export HISTCONTROL=erasedups  # Ignore duplicate entries in history
export HISTSIZE=10000
export  HISTFILE=~/.zsh_history



export HOMEBREW_CASK_OPTS="--appdir=/Applications" # Set install location for brew-cask
