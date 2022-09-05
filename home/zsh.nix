{ config, pkgs, lib, ... }:
{
  programs.zsh = {
    enable = true;
    shellAliases = {
      nixos-apply = "sudo nixos-rebuild switch --flake ~/dotfiles";
      nixos-update = "nix flake update ~/dotfiles && nixos-apply";
      nixos-clean = "sudo nix-collect-garbage -d && sudo nix store optmise";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "autoenv" "git" "history" "history-substring-search" "man" ];
      theme = "juanghurtado";
    };
  };
}
