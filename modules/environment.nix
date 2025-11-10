{ config, pkgs, lib, ...}:

{
###############################################
  time.timeZone = "Asia/Kolkata";
  i18n.defaultLocale = "en_IN";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };
###############################################
  environment = {

  sessionVariables.XDG_DATA_DIRS =
    [ "$HOME/.icons" "/usr/share/icons" ];


  variables = {
    GTK_THEME = "Adwaita:dark";
    GTK_ICON_THEME = "Gruvbox Plus Dark";
  };

  sessionVariables = { LIBVA_DRIVER_NAME = "iHD"; };
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
programs.git = {
  enable = true;
  config = {
    user.name = "Dheer Soni";
    user.email = "dheersoni13@gmail.com";
  };
};


}
