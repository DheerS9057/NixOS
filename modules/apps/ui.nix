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
  ];
}
