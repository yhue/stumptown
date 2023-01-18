#!/bin/bash
set -eux

echo ">>> create an SSH key"
ssh-keygen -t ed25519

echo ">>> install xcode command line tools"
xcode-select --install

echo ">>> install homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo ">>> update homebrew"
brew update

echo ">>> install homebrew bundle"
curl -fsSL https://raw.githubusercontent.com/yhue/stumptown/main/Brewfile | brew bundle install --file=-

echo ">>> cleanup homebrew cache"
brew cask cleanup
brew cleanup

echo ">>> install peaberry"
curl -fsSL https://raw.githubusercontent.com/yhue/peaberry/main/install.sh | bash

echo ">>> set /usr/local/bin/bash as the default shell"
sudo chpass -s /usr/local/bin/bash $(id -un)

echo ">>> reload bash"
exec bash
