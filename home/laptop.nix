{ config, pkgs, lib, ... }:
{
  home.file.wallpapers = {
    source = ./wallpapers/laptop-wsense;
    target = ".wallpapers";
    recursive = true;
  };

  home.file.sshpub = {
    source = ../secrets/laptop-wsense/ssh_pub;
    target = ".ssh/id_ed25519.pub";
  };

  home.file.sshpriv = {
    source = ../secrets/laptop-wsense/ssh_priv;
    target = ".ssh/id_ed25519";
  };

  home.file.hyprpaper = {
    source = ./config/Hyprland/hyprpaper/laptop;
    target = ".config/hypr/hyprpaper.conf";
    recursive = true;
  };

  home.packages = with pkgs; [
    brightnessctl
  ];

  wayland.windowManager.hyprland.extraConfig = (builtins.readFile ./config/Hyprland/laptop) + "\n" + (builtins.readFile ./config/Hyprland/common);

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
    stm32cubeide = {
      name = "STM32Cube IDE";
      genericName = "STM32Cube IDE";
      terminal = false;
      categories = [ "Development" ];
      mimeType = [ "x-scheme-handler/eclipse" ];
      icon = ./icons/mcuxpresso-ide.png;
      exec = "sh -c \"podman-compose -f ~/ides/stm32cube-ide/docker-compose.yml up\"";
    };
  };
}
