#!/bin/bash

# packages for vim plugins
sudo apt-get install build-essential cmake python-dev python3-dev libboost-all-dev libicu-dev

for f in $PWD/*
do
  [[ $(basename $f) == $(basename $0) ]] && continue
  [[ "$(basename $f)" == "config" ]] && continue
  [[ "$(basename $f)" == "README.md" ]] && continue

  ln -sfn $f ~/.$(basename $f)
done

for f in $PWD/config/*
do
  ln -sfn $f ~/.config/$(basename $f)
done

# create undodir
mkdir -p ~/.undodir/
