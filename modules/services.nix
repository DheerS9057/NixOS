{ config, pkgs, lib, ... }:

{
########################################
  networking ={
    hostName = "The-Machine";
    networkmanager.enable = true;
  };
#########################################
  hardware = {
    bluetooth.enable = true;  
  };
#########################################
  services = {
  xserver.enable = false;
  # LY Display Manager
  displayManager.ly.enable = true;
  #PowerProfileCTL
  power-profiles-daemon.enable = true;
  upower.enable = true;
  logind.settings.Login.HandleLidSwitch = "lock";
  logind.settings.Login.HandleLidSwitchExternalPower = "ignore";
  logind.settings.Login.HandleLidSwitchDocked = "ignore";

  udisks2.enable = true;
  
  xserver.xkb = {
    layout = "us";
    variant = "";
   };
   fstrim.enable = true;

  };
#########################################
  systemd = {
  services."getty@tty2".enable = false;

  user.services.udiskie = {
    enable = true;
    description = "Udiskie automount daemon";
    wantedBy = [ "graphical-session.target" ];

    serviceConfig = {
      ExecStart = "${pkgs.udiskie}/bin/udiskie --tray --notify --smart-tray";
      Restart = "on-failure";
      };
    };
  };
###########################################



}
