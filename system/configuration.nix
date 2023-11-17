{ lib, config, pkgs, ... }:
{
  imports =
    [
      ./packages.nix
      ./services.nix
      ./users.nix
      ./audio.nix
    ];

  virtualisation.podman = {
    enable = true;
    dockerSocket.enable = true;
  };

  nixpkgs.config.allowUnfree = true;

  nix = {
    settings = {
      # binary caches
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nixpkgs-wayland.cachix.org-1:3lwxaILxMRkVhehr5StQprHdEo4IrE8sRho9R9HOLYA="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      ];

      substituters = [
        "https://cache.nixos.org"
        "https://nixpkgs-wayland.cachix.org"
        "https://hyprland.cachix.org"
      ];

      experimental-features = [ "nix-command" "flakes" ];
    };
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  time.timeZone = "Europe/Rome";

  i18n = {
    extraLocaleSettings = {
      LANGUGAGE = config.i18n.defaultLocale;
      LC_ALL = config.i18n.defaultLocale;
    };
    defaultLocale = "en_US.UTF-8";
    inputMethod = {
      enabled = "ibus";
      ibus.engines = with pkgs.ibus-engines; [ ];
    };
  };

  hardware.pulseaudio.enable = false;

  security.sudo.wheelNeedsPassword = false;
  security.polkit.enable = true;
  security.pam.services.swaylock = { };

  networking.firewall.enable = false;

  system.userActivationScripts = {
    linkPrusaSlicerConfig = {
      text = ''
        rm -r /home/nychtelios/.config/PrusaSlicer
        ln -s /home/nychtelios/dotfiles/home/config/PrusaSlicer /home/nychtelios/.config/PrusaSlicer
      '';
    };

    linkEasyEffectsConfig = {
      text = ''
        rm /home/nychtelios/.config/easyeffects -r
        ln -s /home/nychtelios/dotfiles/home/easyeffects /home/nychtelios/.config/easyeffects
      '';
    };

    linkVSCodeConfig = {
      text = ''
        rm /home/nychtelios/.config/Code/User/settings.json
        ln -s /home/nychtelios/dotfiles/home/config/vscode.json /home/nychtelios/.config/Code/User/settings.json
      '';
    };
  };

  system.stateVersion = "23.05";
}
