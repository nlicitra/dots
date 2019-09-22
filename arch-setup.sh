#!/bin/bash

install-docker() {
  pacman -S --noconfirm docker
  gpasswd -a $(is -u -n) docker
}

install-python() {
  pacman -S --noconfirm python python-pip
}

install-nvm() {
  pacman -S --noconfirm nvm
  nvm alias default lts/*
}

install-vim() {
  pacman -S --noconfirm vim
}

install-git() {
  pacman -S --noconfirm git
}

install-i3() {
  pacman -S --noconfirm i3
}

install-compton() {
  pacman -S --noconfirm compton
}

install-git
install-docker
install-python
install-nvm
install-i3
install-compton
