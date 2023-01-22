#!/usr/bin/bash

echo "Updating tmux config"

cp ~/.tmux.conf .

echo "Pushing to github..."
git add .
git commit -m "Updating environment config"
echo "Done"
