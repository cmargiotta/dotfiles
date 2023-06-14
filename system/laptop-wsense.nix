{ lib, config, pkgs, ... }:
{
  imports =
    [
      ../secrets/wireguard-wsense.nix
    ];

  networking.networkmanager.enable = true;
  networking.wireless.enable = false;

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  networking.wireless.networks = {
    "R'lyeh" = {
      psk = (builtins.readFile "../secrets/r'lyeh");
    };
  };
}
