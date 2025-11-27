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
      brightnessctl
      pavucontrol
      playerctl
      lact
      cliphist
      kdePackages.okular
      localsend
      xournalpp
      virtualbox
  ];
}
