#!/bin/bash

mkdir ~/.config
cd ~/dotfiles
cp ~/dotfiles/starship/.config/starship.toml ~/.config/starship.toml
sed -i 's/(#a3aed2)\\/(#f7768e)\\/g' ~/.config/starship.toml
sed -i 's/󰕈 ](bg:#a3aed2/󰣀 ](bg:#f7768e/g' ~/.config/starship.toml
sed -i 's/fg:#a3aed2)/fg:#f7768e)/g' ~/.config/starship.toml
stow nvim
stow bashdev
