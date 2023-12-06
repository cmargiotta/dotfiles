{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager.url = "github:rycee/home-manager";
    hypr-contrib.url = "github:hyprwm/contrib";
    hyprland.url = "github:hyprwm/Hyprland";
    iceberg.url = "github:icebox-nix/iceberg";
    nixpkgs-wayland.url = "github:nix-community/nixpkgs-wayland";
    nur.url = "github:nix-community/NUR";
  };

  outputs = { self, nixpkgs, home-manager, hyprland, iceberg, nur, ... }@inputs:
    {
      nixosConfigurations.nixos-desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };

        modules = [
          ./hardware/desktop.nix
          ./system/configuration.nix
          ./system/desktop.nix

          nur.nixosModules.nur

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
            home-manager.users.nychtelios =
              {
                imports =
                  [
                    hyprland.homeManagerModules.default

                    ./home/common.nix
                    ./home/desktop.nix
                  ];

                home.stateVersion = "23.11";
              };
          }
        ];
      };

      nixosConfigurations.cmargiotta = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = inputs;

        modules = [
          ./hardware/laptop-wsense.nix
          ./system/configuration.nix
          ./system/laptop-wsense.nix

          nur.nixosModules.nur

          home-manager.nixosModules.home-manager

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
            home-manager.users.nychtelios =
              {
                imports =
                  [
                    hyprland.homeManagerModules.default

                    ./home/common.nix
                    ./home/laptop-wsense.nix
                  ];

                home.stateVersion = "23.11";
              };
          }
        ];
      };

    };
}
