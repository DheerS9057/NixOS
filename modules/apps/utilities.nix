{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
      safe-rm
      fastfetch 
      overskride
      eza
      cava
      btop
      kew
      yt-dlp
      mpv
      udisks
      udiskie
      gvfs
      brightnessctl
      pavucontrol
      playerctl
      lact
      cliphist
      kdePackages.okular
      localsend
      ectool
      mariadb
      mysql80
      libmysqlclient_3_2

  ];
}
