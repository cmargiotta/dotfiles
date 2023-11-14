{ lib, config, pkgs, ... }:
{
  networking.networkmanager.enable = true;
  networking.wireless.enable = false;

  services.blueman.enable = true;

  services.printing = {
    enable = true;
    logLevel = "debug";

    drivers = [
      pkgs.hplipWithPlugin
    ];
  };

  programs.steam.gamescopeSession = {
    enable = true;
    args = [
      "--rt"
      "--prefer-vk-device 8086:9bc4"
      "-W 3440"
      "-H 1440"
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
