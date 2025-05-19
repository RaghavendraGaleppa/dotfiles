#!/bin/bash
cp -r ~/.config/fish .config/
cp -r ~/.config/nvim .config/
cp -r ~/.config/wlogout .config/
cp -r ~/.config/waybar .config/
cp -r ~/.config/sway .config/
cp -r ~/.config/alacritty .config/

cp ~/.bashrc .
cp ~/.bash_aliases .
cp ~/.vimrc .

git add .;git commit -m "BOOM"; git push
