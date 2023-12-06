{ config, pkgs, ... }:
{
  imports = [
    ./firefox.nix
    ./fish.nix
    ./git.nix
    ./packages.nix
    ./services.nix
    ./theming.nix
    ./vscode.nix
    ./wayland.nix
    ./wrappers.nix
    ../secrets/email.nix
  ];

  home.language = {
    base = "en_US.UTF-8";
    address = "it_IT.UTF-8";
    measurement = "it_IT.UTF-8";
    monetary = "it_IT.UTF-8";
    telephone = "it_IT.UTF-8";
    time = "it_IT.UTF-8";
  };

  home.enableNixpkgsReleaseCheck = true;
}
