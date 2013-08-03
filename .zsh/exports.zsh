# Currently this path is appendend to dynamically when picking a ruby version
export PATH=bin:script:~/.rbenv/bin:~/.bin:node_modules/.bin:/usr/local/sbin:/usr/local/bin:/usr/local/share/npm/bin:/opt/boxen/nvm/v0.8.8/bin:$PATH

# Make some commands not show up in history
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"

# Prefer US English and use UTF-8
export LANG="en_US"
export LC_ALL="en_US.UTF-8"
export TERM=xterm-256color

# Link Homebrew casks in `/Applications` rather than `~/Applications`
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Set VIM as default editor
export LESS='--ignore-case --raw-control-chars'
export EDITOR='vim'
export PAGER='less'
