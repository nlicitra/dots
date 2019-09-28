#!/bin/bash

function install-packages() {
  os=$(grep -oP "^ID\=\K(.*$)" /etc/os-release)
  if [[ -z $os ]]; then
    echo -e " \u001b[31;1m Could not auto-detect OS. Enter os ID manually (i.e. 'ubuntu'): \u001b[0m"
    read os
  fi
  case $os in
    arch)
      echo -e " \u001b[7m Installing Arch packages...\u001b[0m"
      ./install-packages.sh arch
    ;;
    ubuntu)
      echo -e " \u001b[7m Installing Ubuntu packages...\u001b[0m"
      ./install-packages.sh ubuntu
    ;;
    *)
      echo -e " \u001b[31;1m I don't know how to handle $os...exiting. \u001b[0m"
      return 1
  esac
}


echo -e "\u001b[37;1m\u001b[4mSelect an option:\u001b[0m"
echo -e " \u001b[34;1m 1) Install Packages \u001b[0m"
echo -e " \u001b[34;1m 2) Install Shell Tools \u001b[0m"
echo -e " \u001b[34;1m 3) Install Dot Files \u001b[0m"
echo -e " \u001b[31;1m 0) to Exit \u001b[0m"
echo -e " \u001b[34;1m *) Install all \u001b[0m"

read option

case $option in
  "1")echo -e "\u001b[7mInstalling Programs...\u001b[0m"
    install-packages
    ;;
  "2")echo -e "\u001b[7mInstalling Shell..\u001b[0m"
    ./install-shell-tools.sh
    ;;
  "3")echo -e "\u001b[7mInstalling Dot Files...\u001b[0m"
    ./link-dots.sh
    ;;
  "0")echo -e "\u001b[4m\u001b[44m Bye \u001b[0m"
    exit 0;
    ;;
  "*")echo -e "\u001b[7mInstalling everything...\u001b[0m"
    install-packages
    ./install-shell-tools.sh
    ./link-dots.sh
esac
