#! /bin/bash
echo 'Sup Broski!'


# git aliases

# stages everything, commits with the parameter as the message, then pushes to the remote
gp() { git add -A; git commit -m "$1"; git push; }  # Git add, commit, and push to repo
alias gp=gp

# resets a git cache, then add. Usefule for resetting .gitignore
git_reset_cache() { git rm -r --cached .; git add -A;}
alias git_reset_cache=git_reset_cache

# resets everything to the current git branch. Note: very destructive
alias git_kill='git reset --hard && git clean -fd'
alias git_kill=git_kill

# echo a random mac addy
alias rand_mac="openssl rand -hex 6 | sed 's/\(..\)/\1:/g;s/.$//'"

# changes the mac address, this will be reset back to factory Mac upon reboot
# the parameter is the interface you want to change(typically en0)
spoof_mac(){
    NEW_MAC=`rand_mac`
    sudo ifconfig $1 ether $NEW_MAC
    echo "New mac addy: $NEW_MAC"
}
alias spoof_mac=spoof_mac

alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation
alias edit='subl'                           # edit:         Opens any file in sublime editor
alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
alias home="cd ~"                              # ~:            Go Home
alias c='clear'                             # c:            Clear terminal display
alias which='type -all'                     # which:        Find executables
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias show_options='shopt'                  # Show_options: display bash options settings
alias fix_stty='stty sane'                  # fix_stty:     Restore terminal settings when screwed up
alias cic='set completion-ignore-case On'   # cic:          Make tab-completion case-insensitive
mcd () { mkdir -p "$1" && cd "$1"; }        # mcd:          Makes new Dir and jumps inside
alias mcd=mcd
trash () { command mv "$@" ~/.Trash ; }     # trash:        Moves a file to the MacOS trash
alias trash=trash
ql () { qlmanage -p "$*" >& /dev/null; }    # ql:           Opens any file in MacOS Quicklook Preview
alias ql=ql
alias DT='tee ~/Desktop/terminalOut.txt'    # DT:           Pipe content to file on MacOS Desktop
alias grep='grep --color=auto'

extract () {
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
alias extract=extract


function cheat() {
      curl cht.sh/$1
}
alias cheat=cheat


# improve terminal appearance
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[00m\]\$(parse_git_branch)\[\033[00m\] $ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# pyenv
echo 'importing pyenv'
export LDFLAGS="-L/usr/local/opt/zlib/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include"
export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig"
eval "$(pyenv init -)"

# this is rvm
# Load RVM into a shell session *as a function*
echo "importing rvm"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# mcfly
echo "importing mcfly"
if [ -f $(brew --prefix)/opt/mcfly/mcfly.bash ]; then
  . $(brew --prefix)/opt/mcfly/mcfly.bash
fi

# this is for direnv
# https://direnv.net/
echo "importing dotenv"
eval "$(direnv hook bash)"

#  http://davidalger.com/development/bash-completion-on-os-x-with-brew/
#  brew install bash-completion
echo "importing bash completion"
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# Set Up the Database if it does not exist yet
echo "importing hyperjump"

function _hyperjumpdatabase() {
    local dbdir="$HOME"/.local/lib
    local db="$dbdir"/hyperjumpdb
    local db_old="$HOME"/.hyperjumpdb
    if [[ ! -f "$db" ]]; then
        # Create ~/.local/lib directory if it fors not exists
        if [[ ! -d "$dbdir" ]]; then
            mkdir -p "$dbdir" >> /dev/null
        fi
        # If old DB exists, move it to the new location
        if [[ -f "$db_old" ]]; then
            mv "$db_old" "$db"
        else
            touch "$db"
            echo "home:$HOME" >> "$db"
        fi
    fi
    echo "$db"
}

# Jump Remamber - Adds a jump to the database
function jr() {
    local db=$(_hyperjumpdatabase)
    local wd=$(pwd)
    local nick=${wd##*/}
    local nick=${nick// /_}

    if grep -q "$wd$" "$db"; then
        echo "This directory is already added to the database. Run 'jf' to forget it."
    else
        if [[ -z "$1" ]]; then
            echo "We need a nickname for this directory. Use jr <name> or specify it now."
            read -p "[C]ancel, [U]se \"$nick\", Enter [N]ickname [C/U/N]: " -n 1 -e choice
            case "$choice" in
                "U" | "u" )
                    echo "We are going to use $nick as the nickname for this directory."
                    ;;
                "N" | "n" )
                    local nick=
                    while [[ "$nick" = "" ]]; do
                       read -p "Enter a Nickname for this Directory and Press [Enter]: " -e nick
                    done
                    ;;
                * )
                    echo "Nothing was added to the database. Quitting."
                    return
                    ;;
            esac
        else
            local nick=$1
        fi

        local nick=${nick// /_}

        if grep -q "^$nick:" "$db"; then
            echo "Oops, the nickname '$nick' is already in use :( Try again...."
        else
            echo "$nick:$wd" >> "$db"
            echo "Added $wd with Nickname \"$nick\" to the database."
        fi
    fi
}

# Jump Forget - Removes a jump location from the database
function jf() {
    local db=$(_hyperjumpdatabase)

    if [[ -z "$1" ]]; then
        local wd=$(pwd)
        if grep -q ":$wd$" "$db"; then
            local dbline=$(grep ":$wd$" "$db" | head -n 1)
            local nickname=${dbline%:*}
        else
            echo "This directory is not in the database!"
            return
        fi
    else
        local nickname=$1
        if grep -q "^$nickname:" "$db"; then
            local line=$(grep "^$nickname:" "$db" | head -n 1)
            local wd=${line#*:}
        else
            echo "This nickname is not in the database!"
            return
        fi
    fi

    echo "$nickname : $wd"
    read -p "Forget It? [Y/N]: " -n 1 -e choice
    case "$choice" in
        "Y" | "y" )
            local tempfile=$(mktemp -t "XXXjumpdb")
            grep -v ":$wd$" "$db" > "$tempfile"
            cat "$tempfile" > "$db"
            rm "$tempfile"
            echo "$nickname is forgotten!"
            ;;
        * )
            echo "Nothing was deleted from the database. Quitting."
            return
            ;;
    esac
}

# Jump to Nickname - Shows the Dialog Menu with all of the jumps in the db
function jj() {
    local db=$(_hyperjumpdatabase)
    local foundDialog=0

    # If no name on the prompt, than pop up the dialog, else use $1
    if [[ -z "$1" ]]; then
        if ! type dialog > /dev/null 2>&1; then
            # Dialog Utility NOT found, so show alternative
            echo Dialog utility NOT found. Install Dialog to get a nice menu of jump locations.
            echo List of Saved Locations:
            while read line
            do
                printf "    %-25s %s \n" "${line%:*}" "${line#*:}"
            done < <(cat "$db")
        else
            local foundDialog=1
            local list=""
            while read line
            do
                line="'${line%:*}' '${line#*:}' "
                list+=$line
            done < <(cat "$db")

            if [[ "$list" == "" ]]; then
                echo The HyperJump Database is Empty. Bookmark a directory with the jr command to get started.
            else
                local cmd="dialog --menu 'Where do you want to jump to?' 22 76 16 $list"
                local choice=$(eval "$cmd" 2>&1 >/dev/tty)
                clear
            fi
        fi
    else
        local choice=$1
    fi

    # Check if the Jump is legit, and jump
    if grep -q "^$choice:" "$db"; then
        local line=$(grep "^$choice:" "$db" | head -n 1)
        local target=${line#*:}
        echo Navigating to "$choice" at "$target"
        cd "$target"
        # Run Additional Commands If Specified
        local param
        for param in ${@:2}
        do
            if [[ ! -z "$param" && "$param" != "" ]]; then
                local cmd="$param ./"
                echo Running \"$cmd\" inside $choice
                eval "$cmd"
            fi
        done
    else
        if [[ -z "$choice" ]]; then
            # Do not show the message if Dialog was not found
            if [[ "$foundDialog" -eq 1 ]]; then
                echo "Jump Cancelled"
            fi
        else
            echo "Jump Nickname isn't in the Database"
        fi
    fi
}

# Autocomplete for Jump to Nickname
_jj() {
    local db=$(_hyperjumpdatabase)

    local list=""
    while read line
    do
        local list+=" ${line%:*}"
    done < <(cat "$db")

    local cur=${COMP_WORDS[COMP_CWORD]}
    if [[ "$COMP_CWORD" -eq 1 ]]; then
        COMPREPLY=( $(compgen -W "$list" -- "$cur") )
    else
        COMPREPLY=( $(compgen -c "$cur") )
    fi
}

_jr() {
    local wd=$(pwd)
    local nick=${wd##*/}
    local nick=${nick// /_}
    local cur=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=( $(compgen -W "$nick" -- "$cur") )
}

if [[ -n "${ZSH_VERSION-}" ]]; then
    autoload -U +X bashcompinit && bashcompinit
fi

complete -F _jj jj
complete -F _jj jf
complete -F _jr jr

# Display the current branch name in terminal in yellow in the bash prompt
# https://davidwalsh.name/show-git-branch-command-line
echo "importing git branch"
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}





chown -R $(whoami) /usr/local/Homebrew/