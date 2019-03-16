#! /bin/bash

# install/configure updated bash
# https://apple.stackexchange.com/questions/193411/update-bash-to-version-4-0-on-osx
# http://osxdaily.com/2012/03/21/change-shell-mac-os-x/
echo "installing updated bash"
brew install bash
sudo echo "/usr/local/bin/bash" >> /etc/shells
sudo chsh -s /usr/local/bin/bash

# install brew
# installing brew
sudo /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# composer
# python/pip
# node
# aws-cli: https://docs.aws.amazon.com/cli/latest/userguide/installing.html
# jq (cli json parser)
# docker

# setup storm
storm add --id_file ~/.ssh/github  github.com nkiermaier@github.com
storm add --id_file=/Users/admin/.ssh/nick-personal-aws.pem nick-aws ubuntu@34.208.204.238

# show hidden files
defaults write com.apple.finder AppleShowAllFiles YES

sudo pip install aws-shell

{{ vendor }}