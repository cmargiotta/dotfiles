{ pkgs, ... }:
{
  programs.fish.enable = true;

  users.users.nychtelios = {
    isNormalUser = true;
    home = "/home/nychtelios";
    extraGroups = [
      "wheel"
      "networkmanager"
      "podman"
      "dialout"
      "plugdev"
    ];
    hashedPassword = (builtins.substring 0 106 (builtins.readFile ../secrets/nychtelios));
    shell = pkgs.fish;
  };

  security.pam.services.nychtelios.enableGnomeKeyring = true;

  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "fish -c 'source ~/dotfiles/secrets/atuin-login.sh; dbus-run-session -- Hyprland'";
        user = "nychtelios";
      };
      default_session = initial_session;
    };
  };
}
