DISABLE_AUTO_TITLE=true
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

export PATH=/usr/local/bin:/usr/bin:/usr/local/share/python:/bin:/usr/sbin:/sbin:
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

