#!/bin/sh

sudo apt-get -y install vim i3 git

git clone https://github.com/henriknero/Configs

cp -r Configs/confs/i3/i3 ~/.config/
cp Configs/confs/bashrc ~/.bashrc
cp Configs/confs/vimconfigs/vimrc ~/.vimrc

