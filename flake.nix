{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-22.05";
    unstable.url = "nixpkgs/nixos-unstable";

    hypr-contrib.url = "github:hyprwm/contrib";
    home-manager.url = "github:rycee/home-manager/release-22.05";
    nur.url = "github:nix-community/NUR";

    webcord = {
      url = "github:fufexan/webcord-flake";
      inputs.nixpkgs.follows = "unstable";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "unstable";
    };
  };

  outputs = { self, nixpkgs, hypr-contrib, unstable, home-manager, hyprland, nur, webcord, ... }@inputs:
    {
      nixosConfigurations.nixos-desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = inputs;

        modules = [
          ./hardware/desktop.nix
          ./system/configuration.nix
          ./system/desktop.nix

          home-manager.nixosModules.home-manager

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
              };
          }
        ];
      };
    };
}
