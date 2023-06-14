{ config, pkgs, webcord, ... }:
{
  imports = [
    ./firefox.nix
    ./fonts.nix
    ./git.nix
    ./packages.nix
    ./services.nix
    ./vscode.nix
    ./wayland.nix
    ./wrappers.nix
    ./zsh.nix
    ../secrets/email.nix
  ];

  home.language = {
    base = "en_US.UTF-8";
    address = "it_IT.UTF-8";
    measurement = "it_IT.UTF-8";
    monetary = "it_IT.UTF-8";
    telephone = "it_IT.UTF-8";
  };

  home.enableNixpkgsReleaseCheck = true;
  xdg.mimeApps.enable = true;

  programs.kitty = {
    enable = true;
    extraConfig = (builtins.readFile ./themes/kitty);
    font.name = "Iosevka Term";

    settings = {
      scrollback_lines = 10000;
      confirm_os_window_close = 0;
      placement_strategy = "center";

      enable_audio_bell = "no";
      visual_bell_duration = "0.1";

      copy_on_select = "clipboard";
    };
  };
}
