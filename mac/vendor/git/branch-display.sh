# Display the current branch name in terminal in yellow in the bash prompt
# https://davidwalsh.name/show-git-branch-command-line
echo "importing git branch"
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

