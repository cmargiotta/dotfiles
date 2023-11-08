{ lib, config, pkgs, ... }:
{
  imports =
    [
      ../secrets/wireguard-wsense.nix
    ];

  networking.networkmanager.enable = true;
  networking.wireless.enable = false;

  hardware.bluetooth.enable = false;
  hardware.bluetooth.powerOnBoot = false;
  services.blueman.enable = true;

  networking.wireless.networks = {
    "R'lyeh" = {
      psk = (builtins.readFile "../secrets/r'lyeh");
    };
  };
}
