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

  programs = {
    mako = {
      enable = true;
      backgroundColor = "#2e3440";
      borderColor = "#88c0d0";
      borderRadius = 15;
      borderSize = 2;
      height = 110;
      icons = true;
      layer = "overlay";
      width = 300;
    };
  };

  wayland.windowManager.hyprland.extraConfig = (builtins.readFile ./config/Hyprland/desktop) + "\n" + (builtins.readFile ./config/Hyprland/common);

  home.sessionVariables = {
    XDG_SESSION_TYPE = "wayland";
    QT_QPA_PLATFORMTHEME = "qt5ct";
    QT_QPA_PLATFORM = "wayland;xcb";
    XDG_CURRENT_DESKTOP = "sway";
    MOZ_ENABLE_WAYLAND = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
    WLR_DRM_NO_ATOMIC = "1";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    WLR_RENDERER = "vulkan";
  };
}
