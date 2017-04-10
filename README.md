# Dotfiles

These are config files to set up a system the way I like it.

## Installation

  ```bash
  mkdir -p ~/code/
  git clone git://github.com/nooulaif/dotfiles ~/code/dotfiles
  cd ~/code/dotfiles
  ./install.sh
  ```

  Vim plugins are managed through vim-plug.
  You'll need to install [vim-plug](https://github.com/junegunn/vim-plug) to get them.

  ```bash
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  ```
  Run :PlugInstall in vim.

## Inspiration

- [thoughtbot](https://github.com/thoughtbot/dotfiles)
- [Chris Toomey](https://github.com/christoomey/dotfiles)
- [Ben Orenstein](https://github.com/r00k/dotfiles)

