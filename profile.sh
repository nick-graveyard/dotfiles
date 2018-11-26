echo 'Sup Broski!'

# sweet one liner to get current bash script directory
CUR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

# this recursively sources every script in the config folder and subfolders
for f in $CUR_DIR/config/**; do source $f; done


#  http://davidalger.com/development/bash-completion-on-os-x-with-brew/
#  brew install bash-completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# hyperjump bookmarking tool
# https://github.com/x0054/hyperjump
source $CUR_DIR/vendor/hyperjump/hyperjump.sh

# improve terminal appearance

# Display the current branch name in terminal in yellow in the bash prompt
# https://davidwalsh.name/show-git-branch-command-line
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[00m\]\$(parse_git_branch)\[\033[00m\] $ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
