{ config, pkgs, lib, ... }:
{
  home.file.wallpapers = {
    source = ./wallpapers/desktop;
    target = ".wallpapers";
    recursive = true;
  };

  home.file.sshpub = {
    source = ../secrets/desktop/ssh_pub;
    target = ".ssh/id_ed25519.pub";
  };

  home.file.sshpriv = {
    source = ../secrets/desktop/ssh_priv;
    target = ".ssh/id_ed25519";
  };

  home.file.panel_config = {
    source = ./config/panel/config;
    target = ".config/nwg-panel/config";
  };

  home.packages = with pkgs; [
    cura
  ];

  wayland.windowManager.hyprland.enableNvidiaPatches = true;
  wayland.windowManager.hyprland.extraConfig = (builtins.readFile ./config/Hyprland/common) + "\n" + (builtins.readFile ./config/Hyprland/desktop);

  home.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    WLR_DRM_NO_ATOMIC = "1";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
  };
}
