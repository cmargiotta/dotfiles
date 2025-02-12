{ lib, pkgs, ... }:
{
  imports = [
    ../secrets/email.nix
    ./emacs.nix
    ./mail.nix
    ./terminal.nix
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
    linkConfigFiles = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      run ln -sf $HOME/dotfiles/home/config/PrusaSlicer $HOME/.config/
      run ln -sf $HOME/dotfiles/home/config/easyeffects $HOME/.config/
      run ln -sf $HOME/dotfiles/home/config/vscode.json $HOME/.config/Code/User/settings.json
    '';
  };

  xdg.desktopEntries = {
    org-protocol = {
      name = "Org-Protocol";
      exec = "emacsclient %u";
      icon = "emacs-icon";
      type = "Application";
      terminal = false;
      mimeType = [ "x-scheme-handler/org-protocol" ];
    };
  };

  home.enableNixpkgsReleaseCheck = true;
}
