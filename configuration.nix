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
    tmp.cleanOnBoot = true;
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    loader.timeout = 1; 
    kernelParams = [
      "acpi_osi=\"Windows 2018.2\""
      "acpi_os_name=\"Windows 2018\""
      "ec_no_wakeup=1"
      "udev.log_level=3"
      "nowatchdog"
      #"i915.force_probe=46a3"
      "rcutree.enable_rcu_lazy=1"
      "i8042.nomux"
      "i915.enable_psr=0"
      "i915.enable_fbc=0"

    ];
    extraModprobeConfig= ''
    '';


    kernelPackages = pkgs.linuxPackages_latest;
  };
################################
  nix.settings={
                experimental-features = [ "nix-command" "flakes" ];
                auto-optimise-store = true;
               };
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
###################################
 programs.niri.enable = true;
 programs.niri.package = pkgs.niri;



}
