{ lib, config, pkgs, ... }:
{
  imports =
    [
      ../secrets/wireguard-wsense.nix
    ];

  networking.networkmanager.enable = true;
  networking.wireless.enable = false;

  networking.wireless.networks = {
    "R'lyeh" = {
      psk = (builtins.readFile "../secrets/r'lyeh");
    };
  };

  programs.steam.gamescopeSession = {
    enable = true;
    args = [
      "--rt"
      "--prefer-vk-device 8086:9bc4"
      "-W 1920"
      "-H 1080"
      "-f"
      "-e"
    ];
    env = {
      ENABLE_VKBASALT = "1";
      SDL_VIDEODRIVER = "x11";
      GDK_BACKEND = "x11";
    };
  };
}
