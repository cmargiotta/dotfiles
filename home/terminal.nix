{ pkgs
, inputs
, lib
, ...
}:
{
  home.file.starship = {
    source = ./config/starship.toml;
    target = ".config/starship.toml";
    recursive = true;
  };

  home.file.ghostty = {
    source = ./config/ghostty;
    target = ".config/ghostty/config";
  };

  home.packages = [
    inputs.ghostty.packages."${pkgs.stdenv.hostPlatform.system}".default
    (pkgs.fastfetch.overrideAttrs (old: {
      cmakeFlags = old.cmakeFlags ++ [ (lib.cmakeBool "ENABLE_IMAGEMAGICK7" true) ];
    }))

    pkgs.imagemagick
  ];

  programs = {
    starship = {
      enable = true;
      enableFishIntegration = true;
    };

    direnv = {
      enable = true;
    };

    fish = {
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

      functions = {
        fish_greeting = {
          body = ''
            clear
            fastfetch
          '';
        };

        nixos-apply = {
          body = "sudo nixos-rebuild switch --flake ~/dotfiles";
        };

        nixos-clear = {
          body = "home-manager expire-generations \"-6 days\" && sudo nix-collect-garbage -d && sudo nix store optimise";
        };

        nixos-update = {
          body = "nixos-clear && nix flake update --flake ~/dotfiles && nixos-apply";
        };

        fastfetch = {
          body = ''
            set -l image (fd --type file --extension jpeg --extension jpg --extension png 'C\+\+|Lisp|OCaml|Rust|Quantum Computing|Racket|Regex|Algorithms|Architecture|Compilers|Linux|Math|Memes|Prolog' ~/dotfiles/assets/anime-girls-with-programming-books | shuf -n 1)

            set TARGET_WIDTH (math $COLUMNS / 2)
            set TARGET_HEIGHT 70

            set ORIGINAL_DIMENSIONS (identify -format "%wx%h" $image)
            set WIDTH (echo $ORIGINAL_DIMENSIONS | cut -d'x' -f1)
            set HEIGHT (echo $ORIGINAL_DIMENSIONS | cut -d'x' -f2)

            if test (math $TARGET_WIDTH/$WIDTH) -lt (math $TARGET_HEIGHT/$HEIGHT)
              set SCALE (echo "scale=4; $TARGET_WIDTH / $WIDTH" | bc)
            else
              set SCALE (echo "scale=4; $TARGET_HEIGHT / $HEIGHT" | bc)
            end

            set NEW_WIDTH (math "round ($WIDTH * $SCALE)")
            set NEW_HEIGHT (math "round ($HEIGHT * $SCALE / 2)")

            set protocol --logo

            command fastfetch $protocol "$image" --logo-height "$NEW_HEIGHT" --logo-width "$NEW_WIDTH" --logo-type kitty
          '';
        };

        fish_command_not_found = {
          body = '' ${pkgs.nix-index}/etc/profile.d/command-not-found.sh
          '';
        };
      };

      shellInit = ''
        set LOCALE_ARCHIVE \"$(nix profile list | grep glibcLocales | tail -n1 | cut -d ' ' -f4)/lib/locale/locale-archive\"
      '';
    };
  };
}
