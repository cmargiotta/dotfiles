{
  pkgs,
  osConfig,
  lib,
  ...
}:
let
  laptop = osConfig.networking.hostName == "cmargiotta";
  desktop = osConfig.networking.hostName == "nixos-desktop";
in
{
  programs.waybar = {
    enable = true;
    systemd = {
      enable = true;
      target = "hyprland-session.target";
    };
  };
}
