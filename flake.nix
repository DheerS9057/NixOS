{
  description = "Dheer's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    niri={
      url = "github:YaLTeR/niri";
      inputs.nixpkgs.follows = "nixpkgs";
      };

     noctalia ={
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
     };
  };

  outputs = { self, nixpkgs, niri, inputs, ... }: {
    nixosConfigurations.The-Machine = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
            inherit inputs;
          };
          modules = [
            ./configuration.nix
                     ];
                   };
                };
              }


