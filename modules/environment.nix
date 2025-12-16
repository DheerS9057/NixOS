{ config, pkgs, lib, ...}:
{
#################################################
  environment = {

  sessionVariables.XDG_DATA_DIRS =
    [ "$HOME/.icons" "/usr/share/icons" "/run/current-system/sw/share" ];


  variables = {
    GTK_THEME = "Adwaita:dark";
    GTK_ICON_THEME = "Gruvbox Plus Dark";
    EDITOR = "footclient nvim";
    TERMINAL = "footclient";
    VISUAL = "nvim";  
  };

  sessionVariables = { LIBVA_DRIVER_NAME = "iHD";
                       FILE_MANAGER = "thunar";
                       BROWSER = "firefox";
                       TERMINAL = "footclient";
                       VISUAL = "nvim";
                       EDITOR = "footclient nvim";
                       PAGER = "bat";
                       NIXOS_OZONE_WL = 1;

  };
  shells = [ pkgs.fish ];

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
  "application/terminal" = ["footclient"];

  "video/mp4" = [ "mpv.desktop" ];
  "video/x-matroska" = [ "mpv.desktop" ];
};
##################################################


}
