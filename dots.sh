#!/bin/bash

arg=$1

function install_oh_my_zsh() {
  if [[ ! $SHELL = *zsh ]]; then
    echo "You need to be using zsh for oh my zsh to work!"
  fi
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

function install_zsh_plugins() {
  git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
  git clone https://github.com/zdharma/fast-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/fast-syntax-highlighting
  ln -sfnv $PWD/oh-my-zsh-themes/nlicitra.zsh-theme $HOME/.oh-my-zsh/custom/themes/nlicitra.zsh-theme
}

function install_vundle() {
  git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
  vim +PluginUpdate +qall
}

DOT_FILES=(.config/i3 .config/i3status .config/compton.conf .gitconfig .vimrc .zshrc .fonts)

function backup() {
  mkdir -p backup
  rm -rf backup/*
  for file in "${DOT_FILES[@]}"; do
    if [ -f $HOME/$file ]; then
      mv -v $HOME/$file backup/
    fi
  done
}

function link() {
  for file in "${DOT_FILES[@]}"; do
    ln -sfnv $PWD/$file $HOME/$file
  done
}

function install_scripts() {
  sudo ln -sfnv $PWD/scripts/reset-displays.sh /usr/local/bin/reset-displays
}

if [[ "$arg" == "-i" || "$arg" == "--install" ]]; then
  echo -e "\u001b[37;1m\u001b[4mSelect an option:\u001b[0m"
  echo -e " \u001b[34;1m 1) for Oh-My-Zsh \u001b[0m"
  echo -e " \u001b[34;1m 2) for Custom ZSH plugins \u001b[0m"
  echo -e " \u001b[34;1m 3) for Vundle \u001b[0m"
  echo -e " \u001b[34;1m 4) for custom scripts \u001b[0m"
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
    "4")echo -e "\u001b[7mInstalling Custom Scripts...\u001b[0m"
      install_scripts
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
  echo -e "\u001b[32;1mBacking up dotfiles...\u001b[0m"
  backup
  echo -e "\u001b[32;1mLinkin dotfiles...\u001b[0m"
  link
fi
