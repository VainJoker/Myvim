#!/bin/bash
cd $HOME
curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# sudo curl -sL install-node.now.sh/lts | bash
# curl --compressed -o- -L https://yarnpkg.com/install.sh | bash
cp $HOME/myvim/_vimrc $HOME/.vimrc
mkdir $HOME/.config/nvim
cp  $HOME/myvim/init.vim $HOME/.config/nvim/init.vim
cp -u -r  $HOME/myvim/coc $HOME/.config/
vim+PlugInstall
