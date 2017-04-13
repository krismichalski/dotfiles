#!/bin/bash

# packages for vim plugins
sudo apt-get install build-essential cmake python-dev python3-dev libboost-all-dev libicu-dev
sudo npm install -g typescript

for f in $PWD/*
do
  [[ $(basename $f) == $(basename $0) ]] && continue
  [[ "$(basename $f)" == "config" ]] && continue

  ln -sfn $f ~/.$(basename $f)
done

for f in $PWD/config/*
do
  ln -sfn $f ~/.config/$(basename $f)
done

# create undodir
mkdir -p ~/.undodir/

# fonts
if [[ ! -d "./fonts/noto" ]]; then
  mkdir -p ./fonts/noto
  wget https://noto-website.storage.googleapis.com/pkgs/Noto-hinted.zip
  unzip Noto-hinted.zip -d ./fonts/noto
fi
fc-cache -vf ~/.fonts/
