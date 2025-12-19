{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
      obsidian
      whatsie
      libreoffice
 ];
}
