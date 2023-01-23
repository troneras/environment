#!/usr/bin/bash

sudo apt-get update

# Install tmux
sudo apt-get install tmux

# Restore tmux config, vim config, bashrc. Do it with a loop.
echo "Restoring files from home folder"
for file in .tmux.conf .vimrc .bashrc; do
    if [ -f $file ]; then
        cp $file ~/$file
    fi
done

# Decryut ssh.tar.gz.enc and copy it to the home folder
echo "Decrypting ssh.tar.gz.enc"
openssl enc -aes-256-cbc -d -in ssh.tar.gz.enc -out ssh.tar.gz
tar -xzf ssh.tar.gz
cp -r ssh ~/.ssh
rm -rf ssh
rm ssh.tar.gz



echo "Setting tmux config"
