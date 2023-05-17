{ lib, config, pkgs, ... }:
{
  imports =
    [
      ./packages.nix
      ./services.nix
      ./users.nix
    ];

  nixpkgs.overlays = [
    (self: super: {
      waybar = super.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      });
    })
  ];

  virtualisation.podman.enable = true;

  nixpkgs.config.allowUnfree = true;

  nix.gc.automatic = true;
  nix.gc.dates = "weekly";
  nix.optimise.automatic = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  time.timeZone = "Europe/Rome";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.inputMethod = {
    enabled = "ibus";
    ibus.engines = with pkgs.ibus-engines; [ ];
  };

  hardware.pulseaudio.enable = false;

  security.sudo.wheelNeedsPassword = false;
  security.polkit.enable = true;

  networking.firewall.enable = false;

  system.stateVersion = "23.05";
}
