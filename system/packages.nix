{ lib, config, pkgs, ... }:
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
        };
      };
    };
  };
}
