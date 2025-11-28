{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
      obsidian
      libreoffice
      tty-clock
      polychromatic
      grompit-mpx
 ];
}
