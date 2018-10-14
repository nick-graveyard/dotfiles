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

# Display the current branch name in terminal in yellow in the bash prompt
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
alias parse_git_branch=parse_git_branch