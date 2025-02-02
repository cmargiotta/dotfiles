{ ... }:
{
  home.file.sshpub = {
    source = ../secrets/desktop/ssh_pub;
    target = ".ssh/id_ed25519.pub";
  };

  home.file.sshpriv = {
    source = ../secrets/desktop/ssh_priv;
    target = ".ssh/id_ed25519";
  };

  xdg.configFile.hyprland_env_desktop = {
    source = ./config/Hyprland/env-desktop;
    target = ".config/uwsm/env-hyprland-desktop";
  };

  home.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    WLR_DRM_NO_ATOMIC = "1";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
  };
}
