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

# bash completion
brew install bash-completion
# direnv
brew install direnv
brew install git
# hyperjumpp
# hyperjump install not needed, is sourced
# mcfly history tool
brew install mcfly
# pyenv
brew install pyenv
# rvm - ruby version manager

# key
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

# get rvm
\curl -sSL https://get.rvm.io | bash

# progress bar when installing rubies
echo progress-bar >> ~/.curlrc
# stormssh
brew install stormssh




