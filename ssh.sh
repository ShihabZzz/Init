#!/bin/bash
#
# Script to set up ssh connection with Github

# Installing Curl package
echo -e "\n================== Installing Curl package ==================\n"
sudo apt-get install -y curl

echo -e "\n================== Setting up ssh connection with GitHub ==================\n"
read -p "Enter github email : " email
echo "Using email $email"
ssh-keygen -t rsa -b 4096 -C "$email"
ssh-add ~/.ssh/id_rsa
pub=`cat ~/.ssh/id_rsa.pub`
read -p "Enter github username: " githubuser
echo "Using username $githubuser"
read -s -p "Enter github password for user $githubuser: " githubpass
curl -u "$githubuser:$githubpass" -X POST -d "{\"title\":\"CLOUDVM_`date +%Y%m%d%H%M%S`\",\"key\":\"$pub\"}" https://api.github.com/user/keys
