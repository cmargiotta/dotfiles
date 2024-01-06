{ lib, config, pkgs, nixpkgs, ... }:
{
  systemd.user.services = {
    system-update = {
      Unit = {
        Description = "Update system packages and clear old generations";
        After = [ "network.target" ];
      };
      Service = {
        Type = "exec";
        ExecStart = "/etc/profiles/per-user/nychtelios/bin/fish -c 'nixos-update'";
      };
      Install = { WantedBy = [ "default.target" ]; };
    };

    store-update = {
      Unit = {
        Description = "Update system packages and clear old generations";
        After = [ "network.target" ];
      };
      Service = {
        Type = "exec";
        ExecStart = "/etc/profiles/per-user/nychtelios/bin/fish -c nix-index";
      };
      Install = { WantedBy = [ "default.target" ]; };
    };
  };
}
