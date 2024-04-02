{ config, lib, pkgs, ... }:
{
  imports = [
    ./firefox.nix
    ./fish.nix
    ./git.nix
    ./packages.nix
    ./schedule.nix
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

  home.activation = {
    linkConfigFiles = lib.hm.dag.entryAfter ["writeBoundary"] ''
      run ln -sf $HOME/dotfiles/home/config/PrusaSlicer $HOME/.config/
      run ln -sf $HOME/dotfiles/home/config/easyeffects $HOME/.config/
      run ln -sf $HOME/dotfiles/home/config/vscode.json $HOME/.config/Code/User/settings.json
    '';
  };

  home.enableNixpkgsReleaseCheck = true;
}
