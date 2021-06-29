#!/bin/sh
script_dir=$(dirname $(python -c "import os; import sys; print(os.path.realpath(sys.argv[1]))" "$0"))

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir $HOME/.config/nvim

ln -s $script_dir/vimrc $HOME/.config/nvim/init.vim
ln -s $script_dir/lua $HOME/.config/nvim/lua

nvim --headless -c "PlugUpdate | exit | exit"
