{ config, pkgs, lib, ... }:
{
  home.file.wallpapers = {
    source = ./wallpapers/laptop-wsense;
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
    nixgl.nixGLIntel
  ];

  programs.zsh.shellAliases.Hyprland = "nixGLIntel Hyprland";

  wayland.windowManager.hyprland.extraConfig = (builtins.readFile ./config/Hyprland/laptop-wsense) + "\n" + (builtins.readFile ./config/Hyprland/common);

  xdg.desktopEntries = {
    mcuxpresso-ide = {
      name = "MCUXpresso IDE";
      genericName = "MCUXpresso IDE";
      terminal = false;
      categories = [ "Development" ];
      mimeType = [ "x-scheme-handler/eclipse" ];
      icon = ./icons/mcuxpresso-ide.png;
      exec = "sh -c \"podman-compose -f ~/ides/mcuxpresso-ide/docker-compose.yml up\"";
    };
  };
}
