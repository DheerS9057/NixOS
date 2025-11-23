{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nodejs
    wget
    cargo
    python313Packages.pip
    (python3.withPackages (ps: [
        ps.mysql-connector
        ps.tabulate
    ]))
    mysql84
    mariadb
    ectool


  ];
}
