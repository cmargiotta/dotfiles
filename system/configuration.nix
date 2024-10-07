{ config, pkgs, ... }:
{
  virtualisation = {
    docker.enable = true;
    spiceUSBRedirection.enable = true;
  };

  hardware.glasgow.enable = true;

  nixpkgs.config.allowUnfree = true;

  nix = {
    settings = {
      # binary caches
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nixpkgs-wayland.cachix.org-1:3lwxaILxMRkVhehr5StQprHdEo4IrE8sRho9R9HOLYA="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "ai.cachix.org-1:N9dzRK+alWwoKXQlnn0H6aUx0lU/mspIoz8hMvGvbbc="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
      ];

      substituters = [
        "https://cache.nixos.org"
        "https://nixpkgs-wayland.cachix.org"
        "https://hyprland.cachix.org"
        "https://ai.cachix.org"
        "https://nix-community.cachix.org"
        "https://nix-gaming.cachix.org"
      ];

      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  virtualisation.virtualbox.host.enable = true;

  time.timeZone = "Europe/Rome";

  i18n = {
    extraLocaleSettings = {
      LANGUGAGE = config.i18n.defaultLocale;
      LC_ALL = config.i18n.defaultLocale;
    };
    defaultLocale = "en_US.UTF-8";
    inputMethod = {
      type = "ibus";
      ibus.engines = with pkgs.ibus-engines; [ ];
    };
  };

  hardware.pulseaudio.enable = false;

  security.sudo.wheelNeedsPassword = false;
  security.polkit.enable = true;
  security.pam.services.swaylock = { };

  networking.firewall.enable = false;

  boot.kernel.sysctl."net.core.wmem_max" = 12582912;
  boot.kernel.sysctl."net.core.rmem_max" = 12582912;
  boot.kernel.sysctl."net.ipv4.tcp_rmem" = "10240 87380 12582912";
  boot.kernel.sysctl."net.ipv4.tcp_wmem" = "10240 87380 12582912";

  networking = {
    networkmanager = {
      enable = true;
      #dhcp = "dhcpcd";
      wifi.macAddress = "persistent";
      #wifi.backend = "iwd";
    };
    wireless.enable = false;
  };

  system.stateVersion = "23.11";

  imports = [
    ./packages.nix
    ./services.nix
    ./users.nix
    ./audio.nix
    ../secrets/fortinet.nix
  ];
}
