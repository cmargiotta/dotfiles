{ config, pkgs, lib, ... }:
{
  home.file.wallpapers = {
    source = ./wallpapers/laptop;
    target = ".wallpapers";
    recursive = true;
  };

  home.file.waybar = {
    source = ./config/waybar/laptop;
    target = ".config/waybar/config";
  };

  home.file.sshpub = {
    source = ../secrets/laptop-wsense/ssh_pub;
    target = ".ssh/id_ed25519.pub";
  };

  home.file.sshpriv = {
    source = ../secrets/laptop-wsense/ssh_priv;
    target = ".ssh/id_ed25519";
  };

  home.packages = with pkgs; [
    brightnessctl
  ];

  wayland.windowManager.hyprland.extraConfig = (builtins.readFile ./config/Hyprland/laptop) + "\n" + (builtins.readFile ./config/Hyprland/common);
}
