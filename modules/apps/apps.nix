{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
      obsidian
      libreoffice
      vivaldi
      pciutils
 ];
}
