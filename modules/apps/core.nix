{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
      lshw
      git
      ly
      gcc
      nodejs
      curl
      python3
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
  ];
}
