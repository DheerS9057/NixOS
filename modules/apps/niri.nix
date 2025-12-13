{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    niri
    quickshell
    swaybg
    xdg-desktop-portal-gtk
    xdg-desktop-portal-gnome
    gnome-keyring
    kdePackages.polkit-kde-agent-1
    xwayland-satellite
    swayidle
    swaylock
    fuzzel
    alacritty

 ];
}
