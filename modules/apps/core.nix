{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
      lshw
      git
      ly
      gcc
      nodejs
      curl
      bat
      wget
      gnumake
      unzip
      ripgrep
      fd
      cargo
      libnotify
      fzf
      vkbasalt
      libva
      libvdpau
      vulkan-tools
      vulkan-validation-layers
      neovim
      lazygit
      mesa-demos
      psmisc 
      lm_sensors
      s-tui
      xarchiver
      p7zip
      acpica-tools
      imagemagick
      python313Packages.pip
      (python3.withPackages (ps: [
        ps.mysql-connector
        ps.tabulate
      ]))
      zip
      
  ];
}
