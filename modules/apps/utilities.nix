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
      udisks
      udiskie
      brightnessctl
      pavucontrol
      playerctl
      lact
      cliphist
      kdePackages.okular
      localsend
      mpv
      xournalpp
      nautilus
      wev
  ];
}
