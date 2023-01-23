#!/usr/bin/bash

# This script can't be run as root or sudo
if [ "$EUID" -eq 0 ]
  then echo "Please don't run this script as root or sudo"
  exit
fi

# Copy into this folder if file exists in the home folder, tmux config, vim config, bashrc. Do it with a loop.
echo "Copying files from home folder"
for file in .tmux.conf .vimrc .bashrc; do
    if [ -f ~/$file ]; then
        cp ~/$file .
    fi
done


# Copy into this folder the ssh folder and encrypt it with aes-256-cbc
echo "Copying ssh folder and encrypting it"
if [ -d ~/.ssh ]; then
    cp -r ~/.ssh ./ssh
    tar -czf ssh.tar.gz ssh
    openssl enc -aes-256-cbc -salt -in ssh.tar.gz -out ssh.tar.gz.enc
    rm -rf ssh
    rm ssh.tar.gz
fi



# Commit and push to github
echo "Committing and pushing to github"
git add .
git commit -m "Backup environment"
git push

echo "Done"
