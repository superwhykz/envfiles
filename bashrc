###############
# Source other files

# Senstive functions which are not pushed to Github
# It contains GOPATH, some functions, aliases etc...
[ -r ~/.bash_private ] && source ~/.bash_private

# Run twolfson/sexy-bash-prompt
source ~/.bash_prompt

function proxy(){
 export http_proxy=http://127.0.0.1:3128
 export https_proxy=https://127.0.0.1:3128
 export HTTP_PROXY=http://127.0.0.1:3128
 export HTTPS_PROXY=https://127.0.0.1:3128

 #
 # Make sure we will not multiple cntlm processes
 #
 if [ -z $(ps aux | pgrep cntlm) ]; then
   cntlm -c /usr/local/etc/cntlm.conf
   echo -e "Proxy environment variable set."
 fi
}

function proxyoff(){
 pkill cntlm
 unset HTTP_PROXY
 unset http_proxy
 unset HTTPS_PROXY
 unset https_proxy
 unset FTP_PROXY
 unset ftp_proxy
 unset RSYNC_PROXY
 unset rsync_proxy
 echo -e "Proxy environment variable removed."
}

# Get it from the original Git repo: 
# https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
source ~/.git-prompt.sh

# On Mac OS X: brew install bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

###############
# Exports (custom)
export PATH=$PATH:/usr/local/opt/gnu-sed/libexec/gnubin:$HOME/bin:/usr/local/bin:/Applications/Racket\ v6.6/bin
export EDITOR="vim"

# checkout `man ls` for the meaning
export LSCOLORS=cxBxhxDxfxhxhxhxhxcxcx

# enable GIT prompt color
export GIT_PS1_SHOWCOLORHINTS=true

###############
# Bash settings

# -- History
# ignoreboth ignores commands starting with a space and duplicates. Erasedups
# removes all previous dups in history
export HISTCONTROL=ignoreboth:erasedups  
export HISTFILE=~/.bash_history          # be explicit about file path
export HISTSIZE=100000                   # in memory history size
export HISTFILESIZE=100000               # on disk history size
export HISTTIMEFORMAT='%F %T '
shopt -s histappend # append to history, don't overwrite it
shopt -s cmdhist    # save multi line commands as one command

# -- Completion
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind "set completion-ignore-case on" # note: bind used instead of sticking these in .inputrc
bind "set bell-style none" # no bell
bind "set show-all-if-ambiguous On" # show list automatically, without double tab
# bind "TAB: menu-complete" # TAB syle completion

# -- Functions

# extracts the given file
x () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

# -- Misc

# Colored man pages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# check windows size if windows is resized
shopt -s checkwinsize

# autocorrect directory if mispelled
shopt -s dirspell direxpand

# auto cd if only the directory name is given
shopt -s autocd

#use extra globing features. See man bash, search extglob.
shopt -s extglob

#include .files when globbing.
shopt -s dotglob
