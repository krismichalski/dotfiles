#!/bin/zsh

if [ ! -f ~/Library/Fonts/MesloLGS\ NF\ Regular.ttf ]; then
  ln -sfn $PWD/fonts ~/Library/Fonts
  echo "Restart computer, set iTerm2 font to MesloLGS NF then run this script once again"
  exit
fi

for f in $PWD/dotfiles/*
do
  ln -sfn $f ~/.$(basename $f)
done

for f in $PWD/config/*
do
  mkdir -p ~/.config/$(basename $f)/
  for file in $f/*
  do
    ln -sfn $file ~/.config/$(basename $f)/$(basename $file)
  done
done

mkdir -p ~/.undodir/

which brew > /dev/null || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

[ -d ~/.oh-my-zsh ] || sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc

[ -d ~/.oh-my-zsh/custom/themes/powerlevel10k ] || (git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k && source ~/.zshrc)

brew install xsel tmux gnupg neovim fzf node asdf

asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git

brew install --cask github visual-studio-code

sh -c 'curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

nvim +PlugInstall +qall

defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
