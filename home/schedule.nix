{ lib, config, pkgs, nixpkgs, ... }:
{
  systemd.user.services = {
    service-name = {
      Unit.Description = "Update system packages and clear old generations";
      Install.After = [ "network.target" ];
      Service = {
        ExecStart = "fish -c 'nixos-update'";
      };
    };
  };
}
