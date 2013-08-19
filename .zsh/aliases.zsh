# -------------------------------------------------------------------
# Navigation & Directory Information
# -------------------------------------------------------------------
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~"
alias -- -="cd -"
alias dev="cd ~/Developer/"
alias md="mkdir -p"

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
  colorflag="--color"
else # OS X `ls`
  colorflag="-G"
fi

# List all files colorized in long format
alias l="ls -l ${colorflag}"

# List all files colorized in long format, including dot files
alias la="ls -la ${colorflag}"

# Always use color output for `ls`
alias ls="command ls ${colorflag}"
export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'


# -------------------------------------------------------------------
# Git
# -------------------------------------------------------------------
alias g="git"
alias ga='git add'
alias gb='git branch'
alias gc="git commit -v"
alias gca="git commit -v --amend"
alias gcb="git create-branch"
alias gcl='git clone'
alias gco='git checkout'
alias gd='git difftool'
alias gf='git reflog'
alias gfum="git fetch upstream && git merge upstream/master"
alias gl='git log'
alias gp='git push'
alias gphm="git push heroku master"
alias gpnew="git push --set-upstream origin master"
alias gpu='git pull'
alias gra='git remote add'
alias gs='git status -sb'
alias gta='git tag -a -m'
alias gv='git log --pretty=format:'%s' | cut -d " " -f 1 | sort | uniq -c | sort -nr'
alias hb='hub browse'

# -------------------------------------------------------------------
# Homebrew
# -------------------------------------------------------------------
alias bci="brew cask install"
alias bcs="brew cask search"
alias bi="brew install"
alias brewu="brew update; brew upgrade; brew cleanup"

# -------------------------------------------------------------------
# Ruby/Rails
# -------------------------------------------------------------------
alias be="bundle exec"
alias r="ruby"
alias rc="rails console"
alias rdtp="rails db:test:prepare"
alias rg="rails generate"
alias rgc="rails generate controller"
alias rgm="rails generate model"
alias rgmig="rails generate migration"
alias rR="rails routes"
alias rs="rails server"
alias s="rspec"

# -------------------------------------------------------------------
# External commands
# -------------------------------------------------------------------
alias st="subl"
alias ytd="youtube-dl"

# -------------------------------------------------------------------
# Helpers
# -------------------------------------------------------------------
alias df='df -h'            # Disk free, in gigabytes, not bytes
alias du='du -h -c'         # Calculate total disk usage for a folder
alias oo='open .'           # open current directory in OS X Finder
# Get OS X Software Updates, and update installed npm, and their installed packages
alias update='sudo softwareupdate -i -a; npm update npm -g; npm update -g; sudo gem update'
# Clean up LaunchServices to remove duplicates in the “Open With” menu
alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"
# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

