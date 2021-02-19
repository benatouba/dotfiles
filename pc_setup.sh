#! /bin/bash

REPOS='~/.programs/'
SHELL='zsh'
PCKMAN=apt

# exit when any command fails
set -e

# refresh repositories and upgrade
sudo ${PCKMAN} update
sudo ${PCKMAN} -y upgrade

echo "Install basics"
sed 's/#.*//' apt-basics.txt | xargs sudo apt -y install

# init submodules
echo "initialize submodules"
git submodule init
git submodule foreach git pull
git submodule update

# Install Conda package manager
echo "Enter Anaconda Download URL:"
read anaconda
wget ${anaconda}
echo "Download successful"
bash Anaconda*.sh

echo "Conda is installed."

source ~/.${SHELL}rc
echo "Install basic packages into 'base' env. [Uses conda-forge channel]"

conda config --add channels conda-forge
conda install ~/.dotfiles/conda_base.yaml

# Install nvm and node
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
source ~/.profile
nvm install node --latest-npm --default
nvm use node
npm i -g yarn

# Install neovim

echo "Cloning Neovim:"
git clone https://github.com/neovim/neovim.git ${REPOS}
echo "Install dependencies"
sudo ${PCKMAN} -y install ninja-build gettext libtool libtool-bin pkg-config
cd ${REPOS}neovim/
make distclean
make CMAKE_BUILD_TYPE=Release
sudo make install
cd -
pwd
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim --headless -c 'source vim-plug-snapshot.vim | UpdateRemotePlugins | qa'

# Node.js support
echo "install nvim packages for node and python support"
yarn global add neovim

# Ruby support
sudo ${PCKMAN} -y install ruby-dev
sudo gem install neovim

# Oh-my-zsh
cd oh-my-zsh/tools
./install.sh
cd -
pwd

echo "Enter du-dust tar file URL:"
read dust
wget ${dust} ~/Downloads/
tar xvzf ~/Downloads/dust-v*-x86_64-*-linux-*.tar.gz dust
sudo mv ~/Downloads/dust /usr/local/bin/

# Dotbot install
./install
