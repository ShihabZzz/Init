#!/bin/bash
#
# Script to set up ssh connection with Github

# Set Colors
export TERM=xterm
red=$(tput setaf 1)
grn=$(tput setaf 2)
blu=$(tput setaf 4)
cya=$(tput setaf 6)
txtrst=$(tput sgr0)

# Set Build Variables
#echo -ne ${cya}"\nExecute setup script     [y/n]: "${txtrst}
#read setup_script
#echo -e ""

# Installing Curl package
echo -e "\n================== Installing Curl & git package ==================\n"
sudo apt-get install -y curl git

echo -e "\n================== Setting up ssh connection with GitHub ==================\n"
read -p "Enter github email : " email
echo "Using email $email"
ssh-keygen -t rsa -b 4096 -C "$email"
eval `ssh-agent -s`
ssh-add ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub

#pub=`cat ~/.ssh/id_rsa.pub`
#read -p "Enter github username: " githubuser
#echo "Using username $githubuser"
#read -s -p "Enter github password for user $githubuser: " githubpass
#curl -u "$githubuser:$githubpass" -X POST -d "{\"title\":\"CLOUDVM_`date +%Y%m%d%H%M%S`\",\"key\":\"$pub\"}" https://api.github.com/user/keys


# Run Private Script
#if [ "$setup_script" = "y" ];
  #then
  #cd ~ && git clone git@github.com:ShihabZzz/scripts.git && cd scripts && ./setup.sh
  #wait
#fi
