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
        ps.beautifulsoup4
        ps.requests
        ps.numpy
        ps.lxml
    ]))
    mysql84
    mariadb
    ectool
    texliveFull
    freecad

  ];
}
