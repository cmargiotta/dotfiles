#!/usr/bin/env bash

wget https://raw.githubusercontent.com/NixOS/nixpkgs/master/pkgs/applications/editors/vscode/extensions/update_installed_exts.sh
chmod +x update_installed_exts.sh
./update_installed_exts.sh > home/vsocde-extensions.nix
rm update_installed_exts.sh

nix flake update ~/dotfiles && nixos-apply