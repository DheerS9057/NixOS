{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
      obsidian
      libreoffice
      gimp
      vesktop
      tty-clock
      mysql84
      python3Packages.mysql-connector 
      python3Packages.tabulate
      mariadb
 ];
}
