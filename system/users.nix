{ lib, config, pkgs, ... }:
{
  users.users.nychtelios = {
    isNormalUser = true;
    home = "/home/nychtelios";
    extraGroups = [ "wheel" "networkmanager" ];
    hashedPassword = (builtins.substring 0 106 (builtins.readFile ../secrets/nychtelios));
    shell = pkgs.zsh;
  };

  security.pam.services.nychtelios.enableGnomeKeyring = true;
}
