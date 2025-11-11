{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
      obsidian
      libreoffice
      gimp
      vesktop
      whatsie
  ];
}
