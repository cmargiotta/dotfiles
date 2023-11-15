{ lib, config, pkgs, ... }:
{
  networking.networkmanager.enable = true;
  networking.wireless.enable = false;

  services.printing = {
    enable = true;
    logLevel = "debug";

    drivers = [
      pkgs.hplipWithPlugin
    ];
  };
}
