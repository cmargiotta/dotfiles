{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    hypr-contrib.url = "github:hyprwm/contrib";
    iceberg.url = "github:icebox-nix/iceberg";
    nur.url = "github:nix-community/NUR";

    home-manager = {
      url = "github:rycee/home-manager";
    };

    webcord = {
      url = "github:fufexan/webcord-flake";

    };

    hyprland = {
      url = "github:hyprwm/Hyprland";

    };
  };

  outputs = { self, nixpkgs, hypr-contrib, home-manager, iceberg, hyprland, nur, webcord, ... }@inputs:
    {
      nixosConfigurations.nixos-desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = inputs;

        modules = [
          ./hardware/desktop.nix
          ./system/configuration.nix
          ./system/desktop.nix

          home-manager.nixosModules.home-manager
          hyprland.nixosModules.default

          {
            nixpkgs.overlays = [
              nur.overlay
              hypr-contrib.overlays.default
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

                home.stateVersion = "23.05";
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

          home-manager.nixosModules.home-manager

          {
            nixpkgs.overlays = [
              nur.overlay
              hypr-contrib.overlays.default
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

                home.stateVersion = "23.05";
              };
          }
        ];
      };

      nixosConfigurations.zenbook13 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = inputs;

        modules = [
          ./hardware/laptop.nix
          ./system/configuration.nix
          ./system/laptop.nix

          home-manager.nixosModules.home-manager

          {
            nixpkgs.overlays = [
              nur.overlay
              hypr-contrib.overlays.default
            ];

            networking.hostName = "zenbook13";
            home-manager.extraSpecialArgs = inputs;
            home-manager.useUserPackages = true;
            home-manager.useGlobalPkgs = true;
            home-manager.users.nychtelios =
              {
                imports =
                  [
                    hyprland.homeManagerModules.default

                    ./home/common.nix
                    ./home/laptop.nix
                  ];

                home.stateVersion = "23.05";
              };
          }
        ];
      };
    };
}
