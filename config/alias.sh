# custom aliases

# echo a random mac addy
alias rand_mac="openssl rand -hex 6 | sed 's/\(..\)/\1:/g;s/.$//'"


# Display the current branch name in terminal in yellow in the bash prompt
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
alias parse_git_branch=parse_git_branch