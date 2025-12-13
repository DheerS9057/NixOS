{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    quickshell
    swaybg
    kdePackages.polkit-kde-agent-1
    xwayland-satellite
    swayidle
    swaylock
    fuzzel
    alacritty

 ];
}
