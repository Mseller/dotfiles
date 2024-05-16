#!/bin/bash

if [[ "$OSTYPE" == "darwin"* ]]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "unsupported os type"
  exit 1
fi

# Install programs/utils
brew install stow
brew install --cask kitty
brew install --cask alacritty
brew install --cask karabiner-elements
brew install fzf
$(brew --prefix)/opt/fzf/install # Installs useful key bindings and fuzzy completion
brew install go

# Symlink dot files with stow
stow kitty
stow alacritty
stow nvim
stow tmux
stow karbiner

ln -s ./bin/* /usr/local/bin

