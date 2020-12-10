# dotfiles
No description, just configuration. ☺

# Steps
 1. set variables and softlinks.
 2. install zsh
 3. change variable "let g:python3\_host\_prog" in ~/.config/nvim

# Reminder
export HOME=/home/<USER>
ln -s $HOME/code/dotfiles/ ~/.dotfiles
ln -s $HOME/code/dotfiles/vim/ ~/.vim
ln -s $HOME/code/dotfiles/vim/vimrc ~/.vimrc
mkdir ~/.config
ln -s $HOME/code/dotfiles/nvim ~/.config/nvim

mv $HOME/.bashrc $HOME/.bashrc.old

# For neovim
pip install neovim -i https://pypi.douban.com/simple


