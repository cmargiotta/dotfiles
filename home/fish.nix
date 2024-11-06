{ ... }:
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
          clear
          fastfetch
          duf --only local
          atuin init fish | source
        '';
      };

      nixos-apply = {
        body = "sudo nixos-rebuild switch --flake ~/dotfiles";
      };

      nixos-clear = {
        body = "home-manager expire-generations \"-6 days\" && sudo nix-collect-garbage --delete-older-than 1d && sudo nix store optimise";
      };

      nixos-update = {
        body = "nixos-clear && nix flake update --flake ~/dotfiles && nixos-apply";
      };

      fastfetch = {
        body = ''
          set -l image (fd --type file --extension jpeg --extension jpg --extension png 'C\+\+|Lisp|OCaml|Rust|Quantum Computing|Racket|Regex|Algorithms|Architecture|Compilers|Linux|Math|Memes|Prolog' ~/.assets/anime-girls-with-programming-books | shuf -n 1)

          set TARGET_WIDTH (math $COLUMNS / 2)
          set TARGET_HEIGHT 70

          set ORIGINAL_DIMENSIONS (identify -format "%wx%h" $image)
          set WIDTH (echo $ORIGINAL_DIMENSIONS | cut -d'x' -f1)
          set HEIGHT (echo $ORIGINAL_DIMENSIONS | cut -d'x' -f2)

          if test (math $TARGET_WIDTH/$WIDTH) -lt (math $TARGET_HEIGHT/$HEIGHT)
            set SCALE (echo "scale=2; $TARGET_WIDTH / $WIDTH" | bc)
          else
            set SCALE (echo "scale=2; $TARGET_HEIGHT / $HEIGHT" | bc)
          end

          set NEW_WIDTH (math "round ($WIDTH * $SCALE)")
          set NEW_HEIGHT (math "round ($HEIGHT * $SCALE / 2)")

          if string match -q -r '\.(jpeg|jpg)$' $image
             set protocol --logo
          else
             set protocol --kitty-direct
          end

          command fastfetch $protocol "$image" --logo-height "$NEW_HEIGHT" --logo-width "$NEW_WIDTH"
        '';
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
    };

    shellInit = ''
      set LOCALE_ARCHIVE \"$(nix profile list | grep glibcLocales | tail -n1 | cut -d ' ' -f4)/lib/locale/locale-archive\"
      atuin gen-completions --shell fish -o ~/.config/fish/completions/
    '';
  };
}
