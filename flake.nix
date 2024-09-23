{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    zen-browser.url = "github:MarceColl/zen-browser-flake";
    home-manager.url = "github:rycee/home-manager";
    hypr-contrib.url = "github:hyprwm/contrib";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    iceberg.url = "github:icebox-nix/iceberg";
    nixpkgs-wayland.url = "github:nix-community/nixpkgs-wayland";
    nur.url = "github:nix-community/NUR";
    nix-gaming.url = "github:fufexan/nix-gaming";
    waybar.url = "github:Alexays/Waybar";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nixos-hardware,
      hyprland,
      iceberg,
      nur,
      ...
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

          nur.nixosModules.nur
          inputs.nix-gaming.nixosModules.pipewireLowLatency
          home-manager.nixosModules.home-manager

          {
            nixpkgs.overlays = [
              nur.overlay
              inputs.nixpkgs-wayland.overlay
              inputs.hypr-contrib.overlays.default
            ];

            networking.hostName = "nixos-desktop";
            home-manager.extraSpecialArgs = inputs;
            home-manager.useUserPackages = true;
            home-manager.useGlobalPkgs = true;
            home-manager.users.nychtelios = {
              imports = [
                hyprland.homeManagerModules.default

                ./home/common.nix
                ./home/desktop.nix
              ];

              home.stateVersion = "24.11";
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

          nur.nixosModules.nur
          inputs.nix-gaming.nixosModules.pipewireLowLatency
          home-manager.nixosModules.home-manager
          nixos-hardware.nixosModules.dell-latitude-7430

          {
            nixpkgs.overlays = [
              nur.overlay
              inputs.nixpkgs-wayland.overlay
              inputs.hypr-contrib.overlays.default
            ];

            networking.hostName = "cmargiotta";
            home-manager.extraSpecialArgs = inputs;
            home-manager.useUserPackages = true;
            home-manager.useGlobalPkgs = true;
            home-manager.users.nychtelios = {
              imports = [
                hyprland.homeManagerModules.default

                ./home/common.nix
                ./home/laptop.nix
              ];

              home.stateVersion = "24.11";
            };
          }
        ];
      };

    };
}
