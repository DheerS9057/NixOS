{ config, pkgs, ...}:
{
####################################################
 imports = [
  ./apps/apps.nix
  ./apps/core.nix
#  ./apps/gaming.nix
  ./apps/hyprland.nix
  ./apps/ui.nix
  ./apps/utilities.nix
  ./apps/dev.nix
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
    thunar = {
      enable = true;
      plugins = with pkgs; [
          xfce.thunar-archive-plugin
          xfce.thunar-volman
          gvfs
          xfce.tumbler
      ];

    };
    chromium = {
    enable = true;
    proprietaryCodecs = true;
  };
    fish.enable = true;
  };


 };
####################################################
###################################################
}

