{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
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
  ];
}
