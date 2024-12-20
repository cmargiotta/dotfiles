{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    emacs-overlay.url = "github:nix-community/emacs-overlay";
    home-manager.url = "github:rycee/home-manager";
    iceberg.url = "github:icebox-nix/iceberg";
    nix-gaming.url = "github:fufexan/nix-gaming";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nixpkgs-wayland.url = "github:nix-community/nixpkgs-wayland";
    nur.url = "github:nix-community/NUR";
    stylix.url = "github:danth/stylix/release-24.11";
    waybar.url = "github:Alexays/Waybar";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";

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
          inputs.nix-gaming.nixosModules.pipewireLowLatency
          nur.nixosModules.nur
          inputs.stylix.nixosModules.stylix

          {
            nixpkgs.overlays = [
              nur.overlay
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
          inputs.nix-gaming.nixosModules.pipewireLowLatency
          inputs.stylix.nixosModules.stylix
          nixos-hardware.nixosModules.dell-latitude-7430
          nur.nixosModules.nur

          {
            nixpkgs.overlays = [
              nur.overlay
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
