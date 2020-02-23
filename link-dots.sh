#!/bin/bash

DOT_FILES=(
  .config/i3
  .config/i3status
  .config/polybar
  .config/rofi
  .config/compton.conf
  .config/kitty/kitty.conf
  .gitconfig
  .vimrc
  .zshrc
  .fonts
  .icons
  .Xmodmap
  .xinitrc
  wallpaper
)

function get_destination() {
  file=$1
  destination=$file
  if [[ -d $file ]]; then
    if [[ $file =~ (^.*)\/.*$ ]]; then
      destination="${BASH_REMATCH[1]}"
    fi
  fi
  echo $destination
}

function backup() {
  rm -rf backup
  mkdir -p backup
  for file in "${DOT_FILES[@]}"; do
    if [ -e $HOME/$file ]; then
      sudo mv -v $HOME/$file backup/
    fi
  done
}

function linkfiles() {
  for file in "${DOT_FILES[@]}"; do
    destination=$(get_destination $file)
    sudo ln -sfnv $PWD/$file $HOME/$destination
  done
}

echo -e "\u001b[32;1mBacking up dotfiles...\u001b[0m"
backup
echo -e "\u001b[32;1mLinking dotfiles...\u001b[0m"
linkfiles
