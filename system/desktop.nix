{ lib, config, pkgs, ... }:
{
  networking.networkmanager.enable = true;
  networking.wireless.enable = false;

  hardware.bluetooth.enable = false;
  hardware.bluetooth.powerOnBoot = false;

  services.blueman.enable = false;
}
