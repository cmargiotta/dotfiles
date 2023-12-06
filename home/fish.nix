{ config, pkgs, lib, ... }:
{
  home.file.starship = {
    source = ./config/starship.toml;
    target = ".config/starship.toml";
    recursive = true;
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.atuin = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      sync_address = "http://192.168.1.92:9765";
      search_mode = "fuzzy";
      auto_sync = true;
      filter_mode = "global";
      style = "full";
      inline_height = "30";
      sync_frequency = "5m";
    };
  };

  programs.kitty = {
    enable = true;
    extraConfig = (builtins.readFile ./themes/kitty);
    font.name = "Iosevka Term";
    shellIntegration.enableFishIntegration = true;

    settings = {
      scrollback_lines = 10000;
      confirm_os_window_close = 0;
      placement_strategy = "center";

      enable_audio_bell = "no";
      visual_bell_duration = "0.1";

      copy_on_select = "clipboard";

      term = "xterm";
      linux_display_server = "wayland";
    };
  };

  programs.fish = {
    enable = true;
    shellAbbrs = {
      nixos-apply = "sudo nixos-rebuild switch --flake ~/dotfiles";
      nixos-update = "nixos-clear && pushd ~/dotfiles; source update.sh; popd";
      nixos-clear = "sudo nix-collect-garbage -d && sudo nix store optimise";
      ssh = "kitty +kitten ssh";
      reboot = "sudo systemctl reboot";
    };
    shellInit = ''
      set LOCALE_ARCHIVE \"$(nix profile list | grep glibcLocales | tail -n1 | cut -d ' ' -f4)/lib/locale/locale-archive\"
      fastfetch
      atuin gen-completions --shell fish -o ~/.config/fish/completions/
    '';
  };


}
