{ config, pkgs, ...}:
{
####################################################
 imports = [
  ./apps/apps.nix
  ./apps/core.nix
  ./apps/gaming.nix
  ./apps/hyprland.nix
  ./apps/ui.nix
  ./apps/utilities.nix
  ./apps/niri.nix
 ];
####################################################
 nixpkgs = {
    config.allowUnfree = true;
 };
####################################################
 programs = {
    firefox.enable = true;
    hyprland.enable = true; 
    thunar.enable = true;
  };
####################################################
}

