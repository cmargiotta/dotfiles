{ lib, config, pkgs, ... }:
{
  hardware.xone.enable = true;

  services.printing = {
    enable = true;
    logLevel = "debug";
    browsing = true;

    drivers = [
      pkgs.hplipWithPlugin
    ];
  };
}
