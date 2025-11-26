{ config, pkgs, lib, ... }:

{
########################################
  networking ={
    hostName = "The-Machine";
    networkmanager.enable = true;
    firewall = {
      enable = true;

    # Allow incoming connections for LocalSend
      allowedTCPPorts = [ 53317 ];
      allowedUDPPorts = [ 53317 ];

    # Optional: useful if you use multicast discovery
      allowedUDPPortRanges = [
        { from = 53317; to = 53317; }
      ];
    };
    networkmanager.wifi.powersave = true;

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
  #
  logind.settings.Login = {
        HandleLidSwitch = "lock";
        HandleLidSwitchExternalPower = "ignore";
        HandleLidSwitchDocked = "ignore";
        HandlePowerKey="lock";
    };
  #  
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
  services.mysql = {
    enable = true;
    package = pkgs.mariadb; 
   # initialDatabases = [ { name = "train_reservation"; } ];  # Auto-creates DB

  };  }

