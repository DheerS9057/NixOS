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
  displayManager.ly = {
    enable = true;
    settings = {
      "Log.log_session" = false;
      "Log.log_error" = false;
      "Log.log_tty" = false;
      };
    };
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
    enable = false;
    package = pkgs.mariadb; 
   # initialDatabases = [ { name = "train_reservation"; } ];  # Auto-creates DB

  };  
###########################################
    virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;        # avoids certain permission issues :contentReference[oaicite:4]{index=4}
      # Optional: enable TPM / UEFI support (helpful for modern OSes / Windows guests)
      swtpm.enable = true;
      ovmf = {
        enable = true;
        packages = [ (pkgs.OVMF.override { secureBoot = false; tpmSupport = true; }).fd ];
      };
    };
  };

  # Optionally install QEMU and libvirt-related tools
  environment.systemPackages = with pkgs; [
    qemu       # QEMU system emulator / virtualizer :contentReference[oaicite:5]{index=5}
    virt-manager   # graphical VM manager (optional) :contentReference[oaicite:6]{index=6}
    libvirt        # libvirt tools / libraries (optional if you just use Boxes / VMs) :contentReference[oaicite:7]{index=7}
  ];

###########################################
  }

