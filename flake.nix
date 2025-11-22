{
  description = "Dheer's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, ... }: {
    nixosConfigurations.The-Machine = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
          modules = [
            ./configuration.nix
            home-manager.nixosModules.home-manager
                     {
                        home-manager = {
                            useGlobalPkgs = true;
                            useUserPackages = true;
                            users.dheer = import ./home.nix;
                            backupFileExtension= "backup";
                          };
                       }
                     ];
                   };
                };
              }


