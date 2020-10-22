#! /bin/bash

# exit when any command fails
set -e

# refresh repositories and upgrade
sudo apt update
sudo apt upgrade

# Install Conda package manager
echo "Enter Anaconda Download URL:"
read anaconda
wget ${anaconda}
echo "Download successful"
bash Anaconda*.sh

echo "Conda is installed."

source ~/.bashrc
echo "Install basic packages into 'base' env. [Uses conda-forge channel]"

conda config --add channels conda-forge

conda install 

# Install neovim

echo "Enter Neovim Download URL:"
read neovim

wget ${neovim}

echo "Enter Neovim destination path:"
read nvimpath

mkdir -p ${nvimpath}
chmod u+x nvim*.appimage
mv nvim*.appimage ${nvimpath}
# Node.js support
npm install -g neovim
# Python3 support [with separate conda env]
conda create -n neovim3 pynvim flake8 mypy pylint black isort flake8
# Python2 support [with separate conda env]
sudo apt install python-pip
pip2 install pynvim
# Ruby support [via apt installation for now]
sudo apt install ruby-dev
sudo gem install neovim
