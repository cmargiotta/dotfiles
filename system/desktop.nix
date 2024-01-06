{ lib, config, pkgs, ... }:
{
  services.printing = {
    enable = true;
    logLevel = "debug";

    drivers = [
      pkgs.hplipWithPlugin
    ];
  };
}
