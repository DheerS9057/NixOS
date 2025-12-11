{ config, lib, pkgs, ... }:
{
#############################
  imports = [
      ./hardware-configuration.nix
      ./modules/environment.nix
      ./modules/nvidia.nix
      ./modules/services.nix
      ./modules/packages.nix
      ./modules/users.nix
  ];
################################
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    loader.timeout = 1; 
    kernelParams = [
      "acpi_osi=\"!Windows 2018\""
      "udev.log_level=3"
      "nowatchdog"
      "i915.force_probe=46a3"
      "rcutree.enable_rcu_lazy=1"
      "i8042.nomux"
      "uvcvideo"
    ];
    extraModprobeConfig= ''
      options uvcvideo quirks=128
    '';


    kernelPackages = pkgs.linuxPackages_latest;
  };
################################
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
################################
  system = {
    stateVersion = "25.05"; 
  };
################################
  hardware = {
      cpu.intel.updateMicrocode = true;
      enableAllFirmware = true;

    };
################################
    powerManagement = {
      resumeCommands ='' echo "Broooooo Suspend was a success" ''; 
  };
##################################
documentation.man.generateCaches = false;
###################################
hardware.openrazer.enable = true;


}
