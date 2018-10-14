echo 'Sup Broski!'

# sweet one liner to get current bash script directory
CUR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

# this recursively sources every script in the config folder and subfolders
for f in $CUR_DIR/config/**; do source $f; done


#  http://davidalger.com/development/bash-completion-on-os-x-with-brew/
#  brew install bash-completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
