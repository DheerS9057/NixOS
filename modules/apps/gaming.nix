{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
      steam
      lutris
      gamemode
      mangohud
      protonup-qt
      wineWowPackages.full
      winetricks
      gamescope
  ];
}
