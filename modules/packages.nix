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
    };
    fish.enable = true;

    mpv = {
     enable = true;

      package = (
         pkgs.mpv-unwrapped.wrapper {
      scripts = with pkgs.mpvScripts; [
         uosc
         sponsorblock
      ];

       mpv = pkgs.mpv-unwrapped.override {
          waylandSupport = true;
       };
     };
   );

   config = {
     profile = "high-quality";
     ytdl-format = "bestvideo+bestaudio";
     cache-default = 4000000;
    };

    };
####################################################
###################################################
}

