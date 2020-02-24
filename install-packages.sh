#!/bin/bash

case $1 in
  arch)
    os=arch
    update="pacman -Syu"
    install="pacman -S --noconfirm"
  ;;
  ubuntu)
    os=ubuntu
    update="sudo apt update"
    install="sudo apt install -y"
  ;;
  *)
    echo "I don't know how to handle $1...exiting."
    return 1
  ;;
esac
  

install-zsh() {
  $install zsh
}

install-docker() {
  case $os in
    arch)
      $install docker
    ;;
    ubuntu)
      $install docker-ce docker-ce-cli containerd.io
    ;;
  esac
  gpasswd -a $(is -u -n) docker
}

install-python() {
  $install python python-pip
  if [[ $os == "ubuntu" ]]; then
    $install python3 python3-pip
  fi

}

install-vim() {
  $install vim
}

install-git() {
  $install git
}

install-i3() {
  case $os in
    arch)
      $install i3 xorg-init rofi feh kitty compton dunst polybar flashfocus-git
    ;;
    ubuntu)
      sudo add-apt-repository ppa:kgilmer/speed-ricer
      sudo apt update
      $install i3-gaps-wm rofi feh kitty polybar compton dunst libxcb-render0-dev libffi-dev python-dev python-cffi
      pip install flashfocus
    ;;
  esac
}

install-termainl() {
  case $os in
    arch)
      $install cool-retro-term
    ;;
    ubuntu)
      sudo add-apt-repository ppa:vantuz/cool-retro-term
      sudo apt update
      $install cool-retro-term
    ;;
  esac
}

$update
install-zsh
install-git
install-vim
install-docker
install-python
install-terminal
install-i3
