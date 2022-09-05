{ lib, config, pkgs, ... }:
{
  imports =
    [
      ../secrets/wireguard.nix
    ];

  networking.networkmanager.enable = true;
  networking.wireless.enable = false;

  hardware.bluetooth.powerOnBoot = false;

  networking.wireless.networks = {
    "R'lyeh" = {
      psk = (builtins.readFile "../secrets/r'lyeh");
    };
  };
}
