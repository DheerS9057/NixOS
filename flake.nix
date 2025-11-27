{
  description = "Dheer's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { nixpkgs, ... }: {
    nixosConfigurations.The-Machine = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
          modules = [
            ./configuration.nix
                     ];
                   };
                };
              }


