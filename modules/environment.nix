{ config, pkgs, lib, ...}:

{
#################################################
  environment = {

  sessionVariables.XDG_DATA_DIRS =
    [ "$HOME/.icons" "/usr/share/icons" "/run/current-system/sw/share" ];


  variables = {
    GTK_THEME = "Adwaita:dark";
    GTK_ICON_THEME = "Gruvbox Plus Dark";
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  sessionVariables = { LIBVA_DRIVER_NAME = "iHD"; };
  shells = [ pkgs.fish ];

  sessionVariables.NIXOS_OZONE_WL = "1";
};
#################################################
fonts = {
   enableDefaultPackages = true;  
   packages = with pkgs; [
     nerd-fonts.jetbrains-mono
   ];
   fontconfig.enable = true;
 };
#################################################
xdg.mime.defaultApplications = {
  "text/plain" = [ "nvim.desktop" ];
  "text/x-python" = [ "nvim.desktop" ];
  "text/x-c" = [ "nvim.desktop" ];
  "application/json" = [ "nvim.desktop" ];

  "video/mp4" = [ "mpv.desktop" ];
  "video/x-matroska" = [ "mpv.desktop" ];
};


}
