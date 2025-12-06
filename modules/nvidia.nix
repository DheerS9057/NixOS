{ config, pkgs, lib, ...}:
{
##########################################
   services = {
      xserver.videoDrivers = [
        "modesetting" 
        "nvidia"
     ];

      udev.extraRules =''
        #intel
        KERNEL=="card*", \
        KERNELS=="0000:00:02.0", \
        SUBSYSTEM=="drm", \
        SUBSYSTEMS=="pci", \
        SYMLINK+="dri/intel-igpu" 
        #NVIDIA
        KERNEL=="card*", \
        KERNELS=="0000:01:00.0", \
        SUBSYSTEM=="drm", \
        SUBSYSTEMS=="pci", \
        SYMLINK+="dri/nvidia-dgpu"
        '';

  };
###########################################
   hardware = {
     nvidia.prime = {
         offload = {
           enable = true;
         enableOffloadCmd = true;
        };
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };

      graphics = {
        enable = true;
        enable32Bit = true;
        extraPackages = with pkgs; [
          intel-media-driver
          intel-compute-runtime
          vpl-gpu-rt
          ];
      };
 
      nvidia = {
        modesetting.enable = true;
        powerManagement.enable = true;
        powerManagement.finegrained = true;
        open = true;
        nvidiaSettings = true;
        package = config.boot.kernelPackages.nvidiaPackages.beta;
      };

  };
}
