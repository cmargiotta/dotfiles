{ lib, config, pkgs, ... }:
{
  networking.networkmanager.enable = true;
  networking.wireless.enable = false;

  hardware.bluetooth.powerOnBoot = true;
}