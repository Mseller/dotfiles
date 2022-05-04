#!/bin/bash

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  echo "unsupported os type"
  exit 1
elif [[ "$OSTYPE" == "darwin"* ]]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "unsupported os type"
  exit 1
fi


brew install stow
brew install --cask kitty
brew install --cask karabiner-elements
brew install fzf
$(brew --prefix)/opt/fzf/install # Installs useful key bindings and fuzzy completion
brew install go
