#! /bin/bash 

# yes | sudo apt upgrade
yes | sudo apt update
sudo apt install -y git


sudo apt update
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update
apt-cache policy docker-ce
sudo apt install -y docker-ce
sudo systemctl status docker
sudo usermod -aG docker ${USER}
echo "Shell refresh required"

sudo apt install -y git
# hyperjumpp
# hyperjump install not needed, is sourced




