{ config, pkgs, lib, ... }:
{
  home.file.sshpub = {
    source = ../secrets/desktop/ssh_pub;
    target = ".ssh/id_ed25519.pub";
  };

  home.file.sshpriv = {
    source = ../secrets/desktop/ssh_priv;
    target = ".ssh/id_ed25519";
  };

  xdg.configFile.hyprpaper = {
    source = ./config/Hyprland/hyprpaper/desktop;
    target = "hypr/hyprpaper.conf";
    recursive = true;
  };

  xdg.configFile.hyprland = {
    text = (builtins.readFile ./config/Hyprland/common) + "\n" + (builtins.readFile ./config/Hyprland/desktop);
    target = "hypr/hyprland.conf";
  };

  home.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    WLR_DRM_NO_ATOMIC = "1";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
  };
}
