#!/bin/bash

function install_oh_my_zsh() {
  if [[ ! $SHELL = *zsh ]]; then
    echo "You need to be using zsh for oh my zsh to work!"
  fi
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

function install_zsh_plugins() {
  autosuggest_dest=$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
  if [[ ! -e $autosuggest_dest ]]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions $autosuggest_dest
  fi

  fastsyntax_dest=$HOME/.oh-my-zsh/custom/plugins/fast-syntax-highlighting
  if [[ ! -e $fastsyntax_dest ]]; then
    git clone https://github.com/zdharma/fast-syntax-highlighting.git $fastsyntax_dest
  fi
  ln -sfnv $PWD/oh-my-zsh-themes/nlicitra.zsh-theme $HOME/.oh-my-zsh/custom/themes/nlicitra.zsh-theme
}

function install_vimplug() {
  vplug=$HOME/.vim/autoload/plug.vim
  if [[ ! -e $vplug ]]; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
          https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  fi
  vim +PlugInstall
}

function install_scripts() {
  sudo ln -sfnv $PWD/scripts/reset-displays.sh /usr/local/bin/reset-displays
  sudo ln -sfnv $PWD/scripts/compton-blur /usr/local/bin/compton-blur
}

function install_nvm() {
  if [[ -z $NVM_DIR ]]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | $SHELL
  fi
}

install_oh_my_zsh
install_zsh_plugins
install_vimplug
install_nvm
install_scripts
