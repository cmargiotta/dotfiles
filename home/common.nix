{ config, lib, pkgs, ... }:
{
  imports = [
    ../secrets/email.nix
    ./emacs.nix
    ./mail.nix
    ./firefox.nix
    ./fish.nix
    ./git.nix
    ./mime.nix
    ./packages.nix
    ./schedule.nix
    ./services.nix
    ./theming.nix
    ./vscode.nix
    ./wayland.nix
    ./wrappers.nix
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
      run ln -sf $HOME/dotfiles/home/config/emacs $HOME/.config/
      run ln -sf $HOME/dotfiles/home/config/vscode.json $HOME/.config/Code/User/settings.json
      run ln -sf $HOME/dotfiles/assets $HOME/.assets
      run ln -sf $HOME/dotfiles/scripts $HOME/.scripts
      run rm -rf $HOME/.config/emacs/.extension/vscode/cpptools/extension
      run ln -sf ${pkgs.vscode-extensions.ms-vscode.cpptools}/share/vscode/extensions/ms-vscode.cpptools/ $HOME/.config/emacs/.extension/vscode/cpptools/extension
    '';
  };

  home.enableNixpkgsReleaseCheck = true;
}
