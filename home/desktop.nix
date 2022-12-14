{ config, pkgs, lib, ... }:
{
  home.file.wallpapers = {
    source = ./wallpapers/desktop;
    target = ".wallpapers";
    recursive = true;
  };

  home.file.waybar = {
    source = ./config/waybar/desktop;
    target = ".config/waybar/config";
  };

  home.file.sshpub = {
    source = ../secrets/desktop/ssh_pub;
    target = ".ssh/id_ed25519.pub";
  };

  home.file.sshpriv = {
    source = ../secrets/desktop/ssh_priv;
    target = ".ssh/id_ed25519";
  };

  home.packages = with pkgs; [
    cura
  ];

  wayland.windowManager.hyprland.extraConfig = (builtins.readFile ./config/Hyprland/desktop) + "\n" + (builtins.readFile ./config/Hyprland/common);

  home.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    WLR_DRM_NO_ATOMIC = "1";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
  };
}
