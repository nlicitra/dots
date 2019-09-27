#!/bin/bash

install-zsh() {
  pacman -S --noconfirm zsh
}

install-docker() {
  pacman -S --noconfirm docker
  gpasswd -a $(is -u -n) docker
}

install-python() {
  pacman -S --noconfirm python python-pip
}

install-nvm() {
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | $SHELL
}

install-vim() {
  pacman -S --noconfirm vim
}

install-git() {
  pacman -S --noconfirm git
}

install-i3() {
  pacman -S --noconfirm i3 xorg-init rofi feh kitty
}

install-compton() {
  pacman -S --noconfirm compton
}

install-zsh
install-git
install-vim
install-docker
install-python
install-i3
install-compton
install-nvm
