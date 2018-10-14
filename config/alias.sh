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


# note :research or write a navigation library.  History, forward/backward, shortcuts, etc.
go () {

    case $1 in
    "proj") cd /Volumes/SSD1/Projects ;;
    "home") cd ~ ;;
    "dotfiles") cd ~/dotfiles ;;
    esac

}