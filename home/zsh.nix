{ config, pkgs, lib, ... }:
{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = (builtins.readFile ./config/starship.toml);
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;

    history = {
      expireDuplicatesFirst = true;
      extended = false;
      ignoreDups = true;
      save = 1000;
    };

    shellAliases = {
      nixos-apply = "sudo nixos-rebuild switch --flake ~/dotfiles";
      nixos-update = "nixos-clear && pushd ~/dotfiles; source update.sh; popd";
      nixos-clear = "sudo nix-collect-garbage -d && sudo nix store optimise";
      ssh = "kitty +kitten ssh";
      reboot = "sudo systemctl reboot";
    };

    initExtra = ''
      LOCALE_ARCHIVE=\"$(nix profile list | grep glibcLocales | tail -n1 | cut -d ' ' -f4)/lib/locale/locale-archive\"
      fastfetch
    '';

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "history"
        "history-substring-search"
        "man"
      ];
    };
  };
}
