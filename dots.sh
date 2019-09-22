#!/bin/bash

arg=$1

function install_oh_my_zsh() {
  if [[ ! $SHELL = *zsh ]]; then
    echo "You need to be using zsh for oh my zsh to work!"
  fi
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

function install_zsh_plugins() {
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
  git clone https://github.com/zdharma/fast-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/fast-syntax-highlighting
  ln -sfnv ./oh-my-zsh-themes/nlicitra.zsh-theme
}

function install_vundle() {
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  vim +PluginUpdate +qall
}

function backup() {
  mv -v ~/.config/i3 backup/
  mv -v ~/.config/i3status backup/
  mv -v ~/.config/compton.conf backup/
  mv -v ~/.gitconfig backup/
  mv -v ~/.vimrc backup/
  mv -v ~/.zshrc backup/
  mv -v ~/.fonts backup/
}

function link() {
  ln -sfnv $PWD/.config/i3 ~/.config/i3
  ln -sfnv $PWD/.config/i3status ~/.config/i3status
  ln -sfnv $PWD/.config/compton.conf ~/.config/compton.conf
  ln -sfnv $PWD/.gitconfig ~/.gitconfig
  ln -sfnv $PWD/.vimrc ~/.vimrc
  ln -sfnv $PWD/.zshrc ~/.zshrc
  ln -sfnv $PWD/.fonts ~/.fonts
}

if [[ "$arg" == "-i" || "$arg" == "--install" ]]; then
  echo -e "\u001b[37;1m\u001b[4mSelect an option:\u001b[0m"
  echo -e " \u001b[34;1m 1) for Oh-My-Zsh \u001b[0m"
  echo -e " \u001b[34;1m 2) for Custom ZSH plugins \u001b[0m"
  echo -e " \u001b[34;1m 3) for Vundle \u001b[0m"
  echo -e " \u001b[31;1m 0) to Exit \u001b[0m"
  echo -e " \u001b[34;1m *) Install all \u001b[0m"

  read option

  case $option in
    "1")echo -e "\u001b[7mInstalling Oh-My-Zsh...\u001b[0m"
      install_oh_my_zsh
      ;;
    "2")echo -e "\u001b[7mInstalling ZSH custom plugins...\u001b[0m"
      install_zsh_plugins
      ;;
    "3")echo -e "\u001b[7mInstalling Vundle...\u001b[0m"
      install_vundle
      ;;
    "0")echo -e "\u001b[4m\u001b[44m Bye \u001b[0m"
      exit 0;
      ;;
    "*")echo -e "\u001b[7mInstalling everything...\u001b[0m"
      install_oh_my_zsh
      install_zsh_plugins
      install_vundle
  esac
fi

if [[ "$arg" == "-d" || "$arg" == "--dots" ]]; then
  echo -e "\u001b[32;1mLinkin dotfiles...\u001b[0m"
  backup
  link
fi
