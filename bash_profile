# Golang codes
export GOPATH="$HOME/Goarea"
export PATH="$GOPATH/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH"

# Ruby init
eval "$(rbenv init -)"

# NVM init
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# Bash completion for Git
if [ -f $(brew --prefix)/etc/bash_completion ]; then
   . $(brew --prefix)/etc/bash_completion
fi

if [ -f "$(brew --prefix bash-git-prompt)/share/gitprompt.sh" ]; then
    GIT_PROMPT_THEME=Default
    source "$(brew --prefix bash-git-prompt)/share/gitprompt.sh"
fi

# Source ~/.bashrc
. ~/.bashrc

# Source aliases
. ~/.aliases

# Iterm2 feature
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

