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
}
