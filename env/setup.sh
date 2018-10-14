# install brew
sudo /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install/configure updated bash
# https://apple.stackexchange.com/questions/193411/update-bash-to-version-4-0-on-osx
# http://osxdaily.com/2012/03/21/change-shell-mac-os-x/
brew install bash
sudo echo "/usr/local/bin/bash" >> /etc/shells
sudo chsh -s /usr/local/bin/bash

# install storm ssh
brew install stormssh