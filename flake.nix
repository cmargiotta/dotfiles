{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    emacs-overlay.url = "github:nix-community/emacs-overlay";
    ghostty.url = "github:ghostty-org/ghostty";
    home-manager.url = "github:rycee/home-manager";
    iceberg.url = "github:icebox-nix/iceberg";
    nix-gaming.url = "github:fufexan/nix-gaming";
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nixpkgs-wayland.url = "github:nix-community/nixpkgs-wayland";
    nur.url = "github:nix-community/NUR";
    stylix.url = "github:danth/stylix/release-24.11";
    waybar.url = "github:Alexays/Waybar";
    zen-browser.url = "github:fufexan/zen-browser-flake";

    hyprland.url = "github:hyprwm/Hyprland";
    hypr-contrib.url = "github:hyprwm/contrib";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    hypr-dynamic-cursors = {
      url = "github:VirtCode/hypr-dynamic-cursors";
      inputs.hyprland.follows = "hyprland";
    };
    hyprpanel = {
      url = "github:Jas-SinghFSU/HyprPanel?rev=ba7e0dfd52172c9c63ee11da689dce49cf76ae1f";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs =
    { self
    , nixpkgs
    , home-manager
    , nixos-hardware
    , hyprland
    , iceberg
    , nur
    , ...
    }@inputs:
    {
      nixosConfigurations.nixos-desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs;
        };

        modules = [
          ./hardware/desktop.nix
          ./system/configuration.nix
          ./system/desktop.nix

          home-manager.nixosModules.home-manager
          inputs.nix-index-database.nixosModules.nix-index
          inputs.nix-gaming.nixosModules.pipewireLowLatency
          nur.modules.nixos.default
          inputs.stylix.nixosModules.stylix

          {
            nixpkgs.overlays = [
              nur.overlays.default
              inputs.nixpkgs-wayland.overlay
              inputs.hypr-contrib.overlays.default
              inputs.emacs-overlay.overlays.default
            ];

            networking.hostName = "nixos-desktop";

            home-manager = {
              backupFileExtension = "bak";
              extraSpecialArgs = {
                inherit inputs;
              };
              useUserPackages = true;
              useGlobalPkgs = true;
              users.nychtelios = {
                imports = [
                  hyprland.homeManagerModules.default

                  ./home/common.nix
                  ./home/desktop.nix
                ];

                home.stateVersion = "24.11";
              };
            };
          }
        ];
      };

      nixosConfigurations.cmargiotta = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs;
        };

        modules = [
          ./hardware/laptop.nix
          ./system/configuration.nix
          ./system/laptop.nix

          home-manager.nixosModules.home-manager
          inputs.nix-index-database.nixosModules.nix-index
          inputs.nix-gaming.nixosModules.pipewireLowLatency
          inputs.stylix.nixosModules.stylix
          nixos-hardware.nixosModules.dell-latitude-7430
          nur.modules.nixos.default

          {
            nixpkgs.overlays = [
              nur.overlays.default
              inputs.nixpkgs-wayland.overlay
              inputs.hypr-contrib.overlays.default
              inputs.emacs-overlay.overlays.default
            ];

            networking.hostName = "cmargiotta";

            home-manager = {
              backupFileExtension = "bak";
              extraSpecialArgs = {
                inherit inputs;
              };
              useUserPackages = true;
              useGlobalPkgs = true;
              users.nychtelios = {
                imports = [
                  hyprland.homeManagerModules.default

                  ./home/common.nix
                  ./home/laptop.nix
                ];

                home.stateVersion = "24.11";
              };
            };
          }
        ];
      };
    };
}
