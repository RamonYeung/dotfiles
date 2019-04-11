# dotfiles
No description, just configuration. ☺

# Reminder
export HOME=/home/<USER>

ln -s $HOME/code/dotfiles/ .dotfiles

ln -s $HOME/code/dotfiles/vim/ ~/.vim

mv $HOME/.bashrc $HOME/.bashrc.old

echo "source $HOME/.dotfiles/zsh/zshrc" >> $HOME/.bashrc

echo "alias vim="vim -u $HOME/.dotfiles/vim/vimrc" >> $HOME/.bashrc


