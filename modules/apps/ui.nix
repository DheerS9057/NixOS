{ pkgs, config, ... }:

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
      xfce.tumbler
  ];
  fonts.packages = with pkgs; [
  noto-fonts
  noto-fonts-cjk-sans
  noto-fonts-color-emoji
  liberation_ttf
  dejavu_fonts
  freefont_ttf
  corefonts
  vista-fonts
];

fonts.fontconfig = {
  enable = true;
  antialias = true;
  hinting.enable = true;
  hinting.style = "full";
  subpixel.rgba = "rgb";
};



}
