#!/bin/bash

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
