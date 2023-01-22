#!/usr/bin/bash

# This script can't be run as root or sudo
if [ "$EUID" -eq 0 ]
  then echo "Please don't run this script as root or sudo"
  exit
fi

# Copy into this folder if file exists in the home folder, tmux config, vim config, bashrc, gitconfig, gitignore. Do it with a loop.
echo "Copying files from home folder"
for file in .tmux.conf .vimrc .bashrc .gitconfig .gitignore; do
    if [ -f ~/$file ]; then
        cp ~/$file .
    fi
done

# Commit and push to github
echo "Committing and pushing to github"
git add .
git commit -m "Backup environment"
git push

echo "Done"
