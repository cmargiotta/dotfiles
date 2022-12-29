{ config, pkgs, lib, ... }:
{
  programs.zsh = {
    enable = true;
    shellAliases = {
      nixos-apply = "sudo nixos-rebuild switch --flake ~/dotfiles";
      nixos-update = "pushd ~/dotfiles; source update.sh; popd";
      nixos-clean = "sudo nix-collect-garbage -d && sudo nix store optimise";
      ssh = "kitty +kitten ssh";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "autoenv" "git" "history" "history-substring-search" "man" ];
      theme = "juanghurtado";
    };
  };
}
