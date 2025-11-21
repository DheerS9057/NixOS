{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
      obsidian
      libreoffice
      gimp
      vesktop
      tty-clock
      mysql84
      mariadb
      vivaldi


 ];
}
