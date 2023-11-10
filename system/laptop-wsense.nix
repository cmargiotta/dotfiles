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
}
