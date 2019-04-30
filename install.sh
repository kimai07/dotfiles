#!/bin/sh

for f in .zshrc .zsh_alias .zsh_option .zsh_path .zsh_profile
do
  if [ -e $HOME/$f ]; then
    echo "[ERR] already exists $HOME/$f."
    exit
  fi

  echo "ln -s $PWD/$f $HOME/$f"
  ln -s $PWD/$f $HOME/$f
done

source $HOME/.zshrc
