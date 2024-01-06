{ lib, config, pkgs, ... }:
{
  imports =
    [
      ../secrets/wireguard.nix
      ../secrets/wifi.nix
    ];
}
