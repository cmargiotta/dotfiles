{ config, pkgs, lib, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      nixos-apply = "sudo nixos-rebuild switch --flake ~/dotfiles";
      nixos-update = "nixos-clear && pushd ~/dotfiles; source update.sh; popd";
      nixos-clear = "sudo nix-collect-garbage -d && sudo nix store optimise";
      ssh = "kitty +kitten ssh";
    };
    initExtra = ''
      zstyle ':completion:*' menu select
      bindkey "^[[1;5C" forward-word
      bindkey "^[[1;5D" backward-word
      nx() {
        if   [[ $1 == 'search' ]]; then nix search nixpkgs#$2
        elif [[ $1 == 'run' ]]; then nix run nixpkgs#$2
        fi
      }
    '';

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "history" "history-substring-search" "man" ];
      theme = "juanghurtado";
    };
  };
}
