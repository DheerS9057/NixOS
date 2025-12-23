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
      "nowatchdog"
      "i915.force_probe=46a3"
      "rcutree.enable_rcu_lazy=1"
      "i8042.nomux"
    ];
    blacklistedKernelModules = [
    	nove_core
	nouveau
  		];

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
##################################
documentation.man.generateCaches = false;
###################################
###################################
 programs.niri.enable = true;
 programs.niri.package = pkgs.niri;
####################################

}
