{ lib, config, pkgs, nixpkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Others
    busybox
    git
    glibcLocales
    gnome.gnome-keyring
    gnupg
    htop
    libsecret
    nano
    ntfs3g
    pass-secret-service
    unzip
    wget
    zip
  ];

  nixpkgs.overlays = [
    (final: prev: {
      steam = prev.steam.override ({ extraPkgs ? pkgs': [], ... }: {
        extraPkgs = pkgs': (extraPkgs pkgs') ++ (with pkgs'; [
          libgdiplus
        ]);
      });
    })
  ];

  programs = {
    dconf.enable = true;
    hyprland.enable = true;
    steam = {
      enable = true;
      gamescopeSession = {
        enable = true;
        args = [
          "--rt"
          "--prefer-vk-device 8086:9bc4"
          "-W 3440"
          "-H 1440"
          "-f"
          "-e"
        ];
        env = {
          ENABLE_VKBASALT = "1";
          SDL_VIDEODRIVER = "x11";
          GDK_BACKEND="x11";
        };
      };
    };
  };
}
