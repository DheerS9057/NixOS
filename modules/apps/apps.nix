{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
      obsidian
      libreoffice
      tty-clock
      polychromatic
      gompit-mpx
 ];
}
