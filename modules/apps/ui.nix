{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
      nwg-look
      adwaita-icon-theme
      gnome-themes-extra
      rose-pine-hyprcursor
      font-awesome
      qadwaitadecorations
      bibata-cursors
      gruvbox-plus-icons
      libsForQt5.qt5.qtsvg
      libsForQt5.qt5.qtimageformats
      libsForQt5.qt5.qtmultimedia
  ];
}
