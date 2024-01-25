{ lib, config, pkgs, ... }:
{
  hardware.xone.enable = true;

  services.printing = {
    enable = true;
    logLevel = "debug";

    drivers = [
      pkgs.hplipWithPlugin
    ];
  };
}
