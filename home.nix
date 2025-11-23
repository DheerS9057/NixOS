{ config, pkgs, ...}:
{
  home.username = "dheer";
  home.homeDirectory = "/home/dheer";
  home.stateVersion = "25.05";
  home.file.".config/hypr".source = ./dots/config/hypr;
  home.file.".config/waybar".source = ./dots/config/waybar;
  home.file.".config/fastfetch".source = ./dots/config/fastfetch;
  home.file.".config/dunst".source = ./dots/config/dunst;
  home.file.".config/fish".source = ./dots/config/fish;
  home.file.".config/nvim".source = ./dots/config/nvim;
  home.file.".config/wlogout".source = ./dots/config/wlogout;
  home.file.".config/foot".source = ./dots/config/foot;
  home.file.".config/kitty".source = ./dots/config/kitty;
  home.file."Documents/Scripts/".source = ./dots/Scripts ;
  
}
