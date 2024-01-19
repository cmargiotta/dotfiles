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

  programs.direnv = {
    enable = true;
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
      find = "fd";
      g = "git";
      l = "exa";
      la = "exa -a";
      lL = "exa -algiSH --git";
      ll = "exa -l";
      ls = "exa";
      lt = "exa -lT";
      reboot = "sudo systemctl reboot";
    };

    shellAliases = {
      ssh = "kitty +kitten ssh";
    };

    functions = {
      fish_greeting = {
        body = ''
          fastfetch
          duf --only local
          atuin init fish | source
        '';
      };

      nixos-apply = {
        body = "sudo nixos-rebuild switch --flake ~/dotfiles";
      };

      nixos-clear = {
        body = "sudo nix-collect-garbage -d && sudo nix store optimise";
      };

      nixos-update = {
        body = "nixos-clear && nix flake update ~/dotfiles && nixos-apply";
      };

      fish_command_not_found = {
        body = ''
          source ~/.config/fish/functions/_lib.fish
          if test (count (nix-locate --top-level --minimal --at-root --whole-name "/bin/$argv[1]")) -ne 0
              function fish_mode_prompt; end # Remove mode indicator for prompt
              read -n 1 -P $purple"?? nixpkgs has a match for /bin/"$argv[1]". Use it? (y/N) "$resf reply
              if test $reply = y
                set package (nix-locate --top-level --minimal --at-root --whole-name "/bin/$argv[1]")
                nix shell "nixpkgs#$package" -c $argv[1]
              end
          else
              echo "$argv: command not found"
              return 127
          end
        '';
      };

      gitignore = {
        body = "curl -sL https://www.gitignore.io/api/$argv";
      };
    };

    shellInit = ''
      set LOCALE_ARCHIVE \"$(nix profile list | grep glibcLocales | tail -n1 | cut -d ' ' -f4)/lib/locale/locale-archive\"
      atuin gen-completions --shell fish -o ~/.config/fish/completions/
    '';
  };
}
