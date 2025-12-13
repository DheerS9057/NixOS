{
  description = "Dheer's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    niri={
      url = "github:YaLTeR/niri";
      inputs.nixpkgs.follow = "nixpkgs";
      };
  };

  outputs = { self, nixpkgs, niri, ... }: {
    nixosConfigurations.The-Machine = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
          modules = [
            ./configuration.nix


            ({...}: {
              nixpkgs.overlays = [ niri.overlays.niri ];
              })
                     ];
                   };
                };
              }


